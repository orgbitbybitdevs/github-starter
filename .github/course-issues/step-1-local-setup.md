# BitByBit Academy Step 1: Verify SSH authentication

Work in your own template copy of this repository.

## Read First
- [Module 04: SSH setup]({{repo_url}}/blob/main/docs/04-ssh-setup.md)

## Your Task
Run the authentication check from the root of your repository.

macOS/Linux:

```bash
bash scripts/run-auth-check.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-auth-check.ps1
```

Windows Command Prompt:

```bat
scripts\run-auth-check.cmd
```

## What This Check Validates
- Git is installed
- your Git identity is configured
- your SSH key pair exists
- `ssh-agent` is available
- GitHub SSH authentication works when requested

## What Success Looks Like
- the authentication check finishes with no `FAIL`
- you understand that this step is about authentication, not commit signing yet

## When You Finish
1. comment on this issue with a short summary of your results
2. include any `WARN` items you still need to fix
3. close this issue

When this issue is closed, the next guided issue will be created automatically.
