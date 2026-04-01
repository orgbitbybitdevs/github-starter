# Step 1: Verify your local setup

Work in your own template copy of this repository.

## Read First
- [Module 04: SSH setup]({{repo_url}}/blob/main/docs/04-ssh-setup.md)
- [Module 05: Commit signing]({{repo_url}}/blob/main/docs/05-commit-signing.md)

## Your Task
Run the local checks from the root of your repository.

macOS/Linux:

```bash
bash scripts/run-auth-check.sh
bash scripts/run-full-check.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-auth-check.ps1
powershell -ExecutionPolicy Bypass -File scripts/run-full-check.ps1
```

Windows Command Prompt:

```bat
scripts\run-auth-check.cmd
scripts\run-full-check.cmd
```

## What Success Looks Like
- the authentication check finishes with no `FAIL`
- the full setup check finishes with no `FAIL`
- you understand the difference between authentication and signing

## When You Finish
1. comment on this issue with a short summary of your results
2. include any `WARN` items you still need to fix
3. close this issue

When this issue is closed, the next guided issue will be created automatically.
