# BitByBit Academy Step 2: Verify commit signing

You are ready for the signing checkpoint.

## Read First
- [Module 05: Commit signing]({{repo_url}}/blob/main/docs/05-commit-signing.md)

## Your Task
Run the full setup check from the root of your repository.

macOS/Linux:

```bash
bash scripts/run-full-check.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-full-check.ps1
```

Windows Command Prompt:

```bat
scripts\run-full-check.cmd
```

## What This Check Validates
- Git is configured for SSH signing
- the configured signing key exists
- automatic commit signing is enabled
- your SSH key pair is available
- your repository remote is configured correctly

## What Success Looks Like
- the full setup check finishes with no `FAIL`
- you can explain what GitHub means by `Verified`

## When You Finish
1. comment on this issue with a short summary of your results
2. include any `WARN` items you still need to fix
3. close this issue

When this issue is closed, the practice pull request issue will be created automatically.
