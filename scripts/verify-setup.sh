#!/usr/bin/env bash
set -u

pass_count=0
warn_count=0
fail_count=0

pass() {
  pass_count=$((pass_count + 1))
  echo "[PASS] $1"
}

warn() {
  warn_count=$((warn_count + 1))
  echo "[WARN] $1"
}

fail() {
  fail_count=$((fail_count + 1))
  echo "[FAIL] $1"
}

section() {
  echo
  echo "== $1 =="
}

version_ge() {
  local actual="$1"
  local minimum="$2"
  local actual_major actual_minor actual_patch
  local min_major min_minor min_patch

  IFS=. read -r actual_major actual_minor actual_patch <<< "$actual"
  IFS=. read -r min_major min_minor min_patch <<< "$minimum"

  actual_major="${actual_major:-0}"
  actual_minor="${actual_minor:-0}"
  actual_patch="${actual_patch:-0}"
  min_major="${min_major:-0}"
  min_minor="${min_minor:-0}"
  min_patch="${min_patch:-0}"

  if (( actual_major > min_major )); then
    return 0
  fi

  if (( actual_major < min_major )); then
    return 1
  fi

  if (( actual_minor > min_minor )); then
    return 0
  fi

  if (( actual_minor < min_minor )); then
    return 1
  fi

  (( actual_patch >= min_patch ))
}

normalize_version() {
  local raw="$1"

  printf '%s\n' "$raw" | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+).*$/\1/'
}

expand_path() {
  local raw="$1"

  if [[ "$raw" == "~/"* ]]; then
    printf '%s/%s\n' "$HOME" "${raw#~/}"
  else
    printf '%s\n' "$raw"
  fi
}

check_github=0
stage="full"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --check-github)
      check_github=1
      ;;
    --stage)
      shift
      stage="${1:-}"
      ;;
    *)
      echo "Unknown argument: $1"
      echo "Usage: bash scripts/verify-setup.sh [--stage auth|full] [--check-github]"
      exit 2
      ;;
  esac
  shift
done

if [[ "$stage" != "auth" && "$stage" != "full" ]]; then
  echo "Invalid stage: $stage"
  echo "Usage: bash scripts/verify-setup.sh [--stage auth|full] [--check-github]"
  exit 2
fi

section "Git installation"
if command -v git >/dev/null 2>&1; then
  git_version_raw="$(git --version | awk '{print $3}')"
  git_version="$(normalize_version "$git_version_raw")"
  pass "Git is installed ($git_version_raw)."

  if version_ge "$git_version" "2.34.0"; then
    pass "Git version supports SSH commit signing."
  else
    fail "Git 2.34.0 or newer is required for SSH commit signing."
  fi
else
  fail "Git is not installed or not available on PATH."
fi

if ! command -v git >/dev/null 2>&1; then
  section "Summary"
  echo "Passed: $pass_count"
  echo "Warnings: $warn_count"
  echo "Failed: $fail_count"
  exit 1
fi

section "Global Git configuration"
default_branch="$(git config --global --get init.defaultBranch || true)"
if [[ "$default_branch" == "main" ]]; then
  pass "Default branch is configured as 'main'."
else
  fail "Set the default branch with: git config --global init.defaultBranch main"
fi

user_name="$(git config --global --get user.name || true)"
if [[ -n "$user_name" ]]; then
  pass "Global user.name is set to '$user_name'."
else
  fail "Set your name with: git config --global user.name \"Your Name\""
fi

user_email="$(git config --global --get user.email || true)"
if [[ -n "$user_email" ]]; then
  pass "Global user.email is set to '$user_email'."
else
  fail "Set your email with: git config --global user.email \"you@example.com\""
fi

default_public_key_path="$HOME/.ssh/id_ed25519.pub"
default_private_key_path="$HOME/.ssh/id_ed25519"
key_public_check="$default_public_key_path"
key_private_check="$default_private_key_path"

section "Commit signing"
if [[ "$stage" == "full" ]]; then
  gpg_format="$(git config --global --get gpg.format || true)"
  if [[ "$gpg_format" == "ssh" ]]; then
    pass "Git is configured to use SSH signatures."
  else
    fail "Set SSH signing format with: git config --global gpg.format ssh"
  fi

  signing_key_raw="$(git config --global --get user.signingkey || true)"
  if [[ -n "$signing_key_raw" ]]; then
    signing_key_path="$(expand_path "$signing_key_raw")"
    if [[ -f "$signing_key_path" ]]; then
      pass "Configured signing key exists at '$signing_key_raw'."
      key_public_check="$signing_key_path"
      key_private_check="${signing_key_path%.pub}"
    else
      fail "Configured signing key does not exist at '$signing_key_raw'."
    fi
  else
    fail "Set your signing key with: git config --global user.signingkey ~/.ssh/id_ed25519.pub"
  fi

  commit_sign="$(git config --global --get commit.gpgsign || true)"
  if [[ "$commit_sign" == "true" ]]; then
    pass "Automatic commit signing is enabled."
  else
    fail "Enable automatic signing with: git config --global commit.gpgsign true"
  fi
else
  warn "Skipping signing checks for the authentication stage. Run the full check after module 05."
fi

section "SSH key material"
if [[ -f "$key_private_check" && -f "$key_public_check" ]]; then
  pass "SSH key pair exists."
else
  fail "Could not find both the private key and public key."
fi

agent_output="$(ssh-add -l 2>&1 || true)"
if grep -q "The agent has no identities" <<<"$agent_output"; then
  warn "ssh-agent is running but no keys are loaded. Run: ssh-add ~/.ssh/id_ed25519"
elif grep -q "Could not open a connection to your authentication agent" <<<"$agent_output"; then
  warn "ssh-agent is not running in this shell. Start it with: eval \"\$(ssh-agent -s)\""
else
  pass "ssh-agent is responding and has at least one identity loaded."
fi

section "Repository remote"
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  origin_url="$(git remote get-url origin 2>/dev/null || true)"
  if [[ -z "$origin_url" ]]; then
    warn "No 'origin' remote is configured in this repository."
  elif [[ "$origin_url" =~ ^git@github\.com: ]]; then
    pass "Origin remote uses SSH: $origin_url"
    echo "      In this course, origin should usually point to your own template copy."
  else
    warn "Origin remote is not using SSH: $origin_url"
  fi
else
  warn "This directory is not a Git repository, so remote checks were skipped."
fi

section "Live GitHub authentication"
if [[ "$check_github" -eq 1 ]]; then
  ssh_output="$(ssh -T -o BatchMode=yes -o StrictHostKeyChecking=accept-new git@github.com 2>&1 || true)"
  if grep -q "successfully authenticated" <<<"$ssh_output"; then
    pass "GitHub SSH authentication succeeded."
  else
    warn "GitHub SSH authentication could not be confirmed automatically."
    echo "$ssh_output"
  fi
else
  warn "Skipping live GitHub SSH test. Run 'bash scripts/run-auth-check.sh' to test authentication automatically."
fi

section "Summary"
echo "Passed: $pass_count"
echo "Warnings: $warn_count"
echo "Failed: $fail_count"

if [[ "$fail_count" -gt 0 ]]; then
  exit 1
fi
