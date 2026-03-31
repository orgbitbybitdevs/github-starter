#!/bin/bash
set -e

echo "=== 🎓 BitByBit Academy Autograding ==="
echo "Evaluating your Pull Request..."

# 1. Branch Name Verification
if [[ ! "$HEAD_REF" =~ ^feature/evaluation-.* ]]; then
  echo "❌ Error: Your Pull Request is not coming from a 'feature/evaluation-[username]' branch."
  echo "Current branch: $HEAD_REF"
  echo "Hint: Did you forget to run 'git switch -c feature/evaluation-[username]'?"
  exit 1
fi
echo "✅ Branch verification passed: $HEAD_REF"

# 2. File Modification Verification
TARGET_BASE="origin/$BASE_REF"

if ! git diff --name-only "$TARGET_BASE" HEAD | grep -q "^students/"; then
  echo "❌ Error: No files were added or modified in the 'students/' folder."
  echo "Hint: Did you forget to run 'git add students/' before committing?"
  exit 1
fi
echo "✅ Staging verification passed: Changes detected in 'students/' directory."

echo ""
echo "🎉 AUTOGRADING: PASSED"
echo "------------------------------------------------"
echo "Note: Our automated script cannot view your private SSH keys to verify your commit signature."
echo "Please manually check your commit on GitHub to ensure the green 'Verified' badge appears."
echo "If you see the verified badge and this script passed, you have completed the course!"
exit 0
