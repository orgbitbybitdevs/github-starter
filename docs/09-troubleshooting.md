# 🩹 Troubleshooting Reference

***
| [⬅️ Previous: Forks vs Branches](08-fork-origin-upstream.md) | [Next: Practical Evaluation ➡️](10-final-evaluation.md) |
| :--- | ---: |
***

**🎯 Learning Objective:** Provide a standardized, professional checklist to resolve the most consistently encountered Git configuration, authentication, and SSH errors.

When encountering native Git errors during push operations, systematically verify the following before escalating requests.

## 🚨 SSH Authentication Failed

### Error: `Permission denied (publickey)`
**The Issue:** GitHub rejected your SSH connection because the uploaded public key on your account fails to match the private key evaluating locally in your `ssh-agent`.

**Resolutions:**
1. Check if the SSH agent is actively executing and securely loaded your key:
   ```bash
   ssh-add -l
   ```
   *If the terminal returns "The agent has no identities", you must reload the process:*
   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

2. Confirm you explicitly designated the uploaded GitHub key as an **Authentication Key**. Do not generate redundant pairs using `ssh-keygen` continuously; simply re-add the existing `.ssh` public file to GitHub.

## 🚨 Commit Verification Fails

### Error: Commit displays gray "Unverified"
**The Issue:** Your author identity configuration (`user.email`) mathematically mismatched the email validated on your GitHub account, OR you failed to configure your second SSH key expressly as a "Signing Key".

**Resolutions:**
1. Verify global environment metadata:
   ```bash
   git config --global --list
   ```
   *Verify `user.email` aligns perfectly structurally with the primary email assigned directly to your GitHub Settings > Emails page.*
2. Verify you instantiated **two separate keys** via the GitHub UI using your identical local payload (`.pub` file). One explicitly locked as *Authentication Key*, one explicitly locked as *Signing Key*.

## 🚨 Push Failures 

### Error: `Support for password authentication was removed. Please use a personal access token instead.`
**The Issue:** You explicitly cloned the repository utilizing GitHub's legacy HTTPS schema, rather than the cryptographically secure SSH protocol.

**Resolution:**
Migrate the isolated `origin` alias natively from HTTPS securely to SSH:
```bash
git remote set-url origin git@github.com:username/repo.git
```

***
| [⬅️ Previous: Forks vs Branches](08-fork-origin-upstream.md) | [Next: Practical Evaluation ➡️](10-final-evaluation.md) |
| :--- | ---: |
