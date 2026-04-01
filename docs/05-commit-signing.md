# 🖋️ Enable Commit Signing

***
| [<- Previous: Set Up SSH](04-ssh-setup.md) | [Next: Make Your First Commit ->](06-first-commit.md) |
| :--- | ---: |
***

## 🎯 Outcome
Configure Git to sign commits with SSH and understand what GitHub checks before showing the `Verified` badge.

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

## 🧪 Verify
Run:

```bash
git config --global --get gpg.format
git config --global --get user.signingkey
git config --global --get commit.gpgsign
```

Then run the local setup check:

```bash
bash scripts/verify-setup.sh
```

After you push a signed commit to GitHub, inspect the latest commit in the GitHub UI and confirm that it shows `Verified`.

## 🏁 Success Criteria
- `gpg.format` is set to `ssh`.
- `user.signingkey` points to your public SSH key.
- `commit.gpgsign` is set to `true`.
- You can explain that authentication controls access to GitHub, while signing proves commit authorship.

***
| [<- Previous: Set Up SSH](04-ssh-setup.md) | [Next: Make Your First Commit ->](06-first-commit.md) |
| :--- | ---: |
