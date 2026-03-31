# 🩹 Troubleshooting Reference

***
| [⬅️ Previous: Forks vs Branches](08-fork-origin-upstream.md) | [Next: Practical Evaluation ➡️](10-final-evaluation.md) |
| :--- | ---: |
***

**🎯 Learning Objective:** Provide a master engineering checklist to resolve the most consistently encountered Git infrastructure failures immediately.

When debugging Git failures natively, scan these resolutions prior to posting an issue.

## 🚨 SSH Authentication Failed

### Error: `Permission denied (publickey)`
**The Issue:** GitHub rejected your Secure Shell handshake. The uploaded public key failed cryptographic verification against your local machine's `ssh-agent`.

**Resolutions:**
1. Check if the agent is natively running and holds your mapped payload:
   ```bash
   ssh-add -l
   ```
   *If it says "The agent has no identities", you skipped restarting the memory chain. Execute:*
   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

2. Confirm you copied the `Authentication Key` distinctly instead of appending it. Overwriting existing keys structurally invalidates previous architectures. Do not execute `ssh-keygen` redundantly! Re-add the existing file.

## 🚨 Commit Authentication Fails

### Error: Commit displays gray "Unverified"
**The Issue:** Your author identity configuration string failed to rigidly map against your GitHub platform email securely. Or you failed to select "Signing Key".

**Resolutions:**
1. Dump your global configuration string securely:
   ```bash
   git config --global --list
   ```
   *Verify `user.email` aligns perfectly structurally with the primary email assigned directly to your GitHub Settings > Emails page!*
2. Verify you instantiated **TWO separate keys** via the GitHub UI using your identical local payload. One explicitly locked as *Authentication Key*, one explicitly locked as *Signing Key*.

## 🚨 Push Failures 

### Error: `Support for password authentication was removed. Please use a personal access token instead.`
**The Issue:** You accidentally cloned the repository utilizing GitHub's legacy HTTPS schema, avoiding your newly integrated `ed25519` architecture bypass.

**Resolution:**
Migrate the `origin` alias natively from HTTPS securely to SSH structural framing:
```bash
git remote set-url origin git@github.com:username/repo.git
```

***
| [⬅️ Previous: Forks vs Branches](08-fork-origin-upstream.md) | [Next: Practical Evaluation ➡️](10-final-evaluation.md) |
| :--- | ---: |
