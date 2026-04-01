#!/usr/bin/env bash
set -euo pipefail

pass() {
  echo "[PASS] $1"
}

fail() {
  echo "::error::$1"
  echo "[FAIL] $1"
  exit 1
}

require_env() {
  local name="$1"

  if [[ -z "${!name:-}" ]]; then
    fail "Missing required environment variable: $name."
  fi
}

echo "=== BitByBit Template Autograding ==="
echo "Evaluating the final course submission..."

require_env HEAD_REF
require_env BASE_REF

HEAD_SHA="${HEAD_SHA:-HEAD}"

git fetch --no-tags origin "$BASE_REF":"refs/remotes/origin/$BASE_REF"

if [[ "$BASE_REF" != "main" ]]; then
  fail "The pull request must target 'main'. Current base: '$BASE_REF'."
fi
pass "Base branch is main."

if [[ "$HEAD_REF" == "main" ]]; then
  fail "The final evaluation must come from a feature branch, not 'main'."
fi

if [[ "$HEAD_REF" =~ ^feature/evaluation-([A-Za-z0-9._-]+)$ ]]; then
  username="${BASH_REMATCH[1]}"
else
  fail "Branch name must match 'feature/evaluation-[username]'. Current branch: '$HEAD_REF'."
fi
pass "Branch name is valid: $HEAD_REF"

student_file="students/$username.md"
changed_files="$(git diff --name-only --diff-filter=AM "origin/$BASE_REF...$HEAD_SHA")"

if [[ -z "$changed_files" ]]; then
  fail "No added or modified files were found in this pull request."
fi

file_count="$(printf '%s\n' "$changed_files" | sed '/^$/d' | wc -l | tr -d ' ')"
if [[ "$file_count" -ne 1 ]]; then
  fail "The final evaluation must change exactly one file: '$student_file'."
fi

if ! printf '%s\n' "$changed_files" | grep -qx "$student_file"; then
  fail "Expected changed file '$student_file', but found: $(printf '%s' "$changed_files")"
fi

if ! git diff --name-status --diff-filter=A "origin/$BASE_REF...$HEAD_SHA" | awk '{print $2}' | grep -qx "$student_file"; then
  fail "Your submission must add a new file named '$student_file'."
fi
pass "Student submission file is correct: $student_file"

if [[ ! -f "$student_file" ]]; then
  fail "Submission file '$student_file' does not exist in the checked out branch."
fi

if [[ ! -s "$student_file" ]]; then
  fail "Submission file '$student_file' is empty."
fi

if ! grep -Fqx "GitHub username: $username" "$student_file"; then
  fail "Submission file must contain the exact line 'GitHub username: $username'."
fi

for required_heading in \
  'What `git add` does:' \
  'Authentication vs signing:' \
  'What `origin` points to in your copy of this template:'; do
  if ! grep -Fq "$required_heading" "$student_file"; then
    fail "Submission file is missing the required section '$required_heading'."
  fi
done

line_count="$(wc -l < "$student_file" | tr -d ' ')"
if [[ "$line_count" -lt 8 ]]; then
  fail "Submission file is too short. Add complete answers under each required section."
fi
pass "Submission file includes the required reflection content."

commit_count="$(git rev-list --count "origin/$BASE_REF..$HEAD_SHA")"
if [[ "$commit_count" -lt 1 ]]; then
  fail "No commits were found in the pull request range."
fi
pass "Pull request includes $commit_count commit(s)."

latest_subject="$(git log -1 --pretty=%s "$HEAD_SHA")"
if [[ "$latest_subject" != "docs: submit final evaluation" ]]; then
  fail "Latest commit message must be 'docs: submit final evaluation'. Current message: '$latest_subject'."
fi
pass "Latest commit message is correct."

if ! git cat-file -p "$HEAD_SHA" | grep -q '^gpgsig '; then
  fail "The latest commit is not signed. Enable SSH commit signing and create a new commit."
fi
pass "A signed commit was detected on the branch tip."

echo
echo "[PASS] Autograding complete."
echo "Manual review reminder: GitHub should show 'Verified' on the latest commit when the signing key is correctly registered to the author account."
