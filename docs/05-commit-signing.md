# 🖋️ Enable Commit Signing

***
| [<- Previous: Set Up SSH](04-ssh-setup.md) | [Next: Make Your First Commit ->](06-first-commit.md) |
| :--- | ---: |
***

## 🎯 Outcome
Configure Git to sign commits with SSH and understand what GitHub checks before showing the `Verified` badge.

[![Run Full Setup Check](https://img.shields.io/badge/Run-Full%20Setup%20Check-0969da?style=for-the-badge)](#run-full-check)

## ✅ You Should Be Able To
- explain the difference between authentication and signing
- configure Git for SSH commit signing
- explain what GitHub verifies when it marks a commit as `Verified`

## 🧠 Key Ideas
- Authentication proves your machine can connect to GitHub.
- Signing proves a commit contains a cryptographic signature from a registered signing key.
- A signed commit is not the same thing as a pushed commit. You can push unsigned commits, and you can sign commits before pushing them.

## 🛡️ What GitHub Verifies
GitHub can mark a commit as `Verified` when:

1. the commit contains a valid cryptographic signature
2. the signature matches a public signing key registered to the account
3. the commit metadata is consistent enough for GitHub to attribute the signature correctly

## 1️⃣ Add Your Public Key As A Signing Key
You can reuse the same SSH public key you created in the previous module.

1. print the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

2. open **GitHub -> Settings -> SSH and GPG keys**
3. click **New SSH key**
4. select **Signing Key**
5. paste the public key and save

## 2️⃣ Configure Git To Sign Commits
Run:

```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
```

<a id="run-full-check"></a>
## 🧪 Verify
Run:

```bash
git config --global --get gpg.format
git config --global --get user.signingkey
git config --global --get commit.gpgsign
```

Then run the full setup check from the root of your template copy:

```bash
bash scripts/run-full-check.sh
```

On Windows PowerShell, run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-full-check.ps1
```

On Windows Command Prompt, run:

```bat
scripts\run-full-check.cmd
```

After you push a signed commit to GitHub, inspect the latest commit in the GitHub UI and confirm that it shows `Verified`.

The script prints `PASS`, `WARN`, and `FAIL` directly in the terminal. At this stage, signing checks are required and should pass.

## 🏁 Success Criteria
- `gpg.format` is set to `ssh`.
- `user.signingkey` points to your public SSH key.
- `commit.gpgsign` is set to `true`.
- You can explain that authentication controls access to GitHub, while signing proves commit authorship.

***
| [<- Previous: Set Up SSH](04-ssh-setup.md) | [Next: Make Your First Commit ->](06-first-commit.md) |
| :--- | ---: |
