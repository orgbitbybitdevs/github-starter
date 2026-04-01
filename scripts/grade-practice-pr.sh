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

echo "=== BitByBit Practice Pull Request Check ==="
echo "Evaluating the practice pull request..."

require_env HEAD_REF
require_env BASE_REF

HEAD_SHA="${HEAD_SHA:-HEAD}"

git fetch --no-tags origin "$BASE_REF":"refs/remotes/origin/$BASE_REF"

if [[ "$BASE_REF" != "main" ]]; then
  fail "The pull request must target 'main'. Current base: '$BASE_REF'."
fi
pass "Base branch is main."

if [[ "$HEAD_REF" =~ ^feature/practice-([A-Za-z0-9._-]+)$ ]]; then
  username="${BASH_REMATCH[1]}"
else
  fail "Branch name must match 'feature/practice-[username]'. Current branch: '$HEAD_REF'."
fi
pass "Branch name is valid: $HEAD_REF"

practice_file="practice/$username.md"
changed_files="$(git diff --name-only --diff-filter=AM "origin/$BASE_REF...$HEAD_SHA")"

if [[ -z "$changed_files" ]]; then
  fail "No added or modified files were found in this pull request."
fi

file_count="$(printf '%s\n' "$changed_files" | sed '/^$/d' | wc -l | tr -d ' ')"
if [[ "$file_count" -ne 1 ]]; then
  fail "The practice pull request must change exactly one file: '$practice_file'."
fi

if ! printf '%s\n' "$changed_files" | grep -qx "$practice_file"; then
  fail "Expected changed file '$practice_file', but found: $(printf '%s' "$changed_files")"
fi

if ! git diff --name-status --diff-filter=A "origin/$BASE_REF...$HEAD_SHA" | awk '{print $2}' | grep -qx "$practice_file"; then
  fail "Your practice pull request must add a new file named '$practice_file'."
fi
pass "Practice file is correct: $practice_file"

if [[ ! -f "$practice_file" ]]; then
  fail "Practice file '$practice_file' does not exist in the checked out branch."
fi

if [[ ! -s "$practice_file" ]]; then
  fail "Practice file '$practice_file' is empty."
fi

if ! grep -Fqx "GitHub username: $username" "$practice_file"; then
  fail "Practice file must contain the exact line 'GitHub username: $username'."
fi

for required_heading in \
  'What I verified locally:' \
  'What `origin` points to in my template copy:'; do
  if ! grep -Fq "$required_heading" "$practice_file"; then
    fail "Practice file is missing the required section '$required_heading'."
  fi
done

line_count="$(wc -l < "$practice_file" | tr -d ' ')"
if [[ "$line_count" -lt 6 ]]; then
  fail "Practice file is too short. Add complete answers under each required section."
fi
pass "Practice file includes the required reflection content."

latest_subject="$(git log -1 --pretty=%s "$HEAD_SHA")"
if [[ "$latest_subject" != "docs: submit practice check" ]]; then
  fail "Latest commit message must be 'docs: submit practice check'. Current message: '$latest_subject'."
fi
pass "Latest commit message is correct."

if ! git cat-file -p "$HEAD_SHA" | grep -q '^gpgsig '; then
  fail "The latest commit is not signed. Enable SSH commit signing and create a new signed commit."
fi
pass "A signed commit was detected on the branch tip."

echo
echo "[PASS] Practice pull request check complete."
