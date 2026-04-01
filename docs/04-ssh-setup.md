# 🔐 Set Up SSH Authentication

***
| [<- Previous: Configure Identity](03-configure-identity.md) | [Next: Enable Commit Signing ->](05-commit-signing.md) |
| :--- | ---: |
***

## 🎯 Outcome
Generate an SSH key pair, load it into `ssh-agent`, and register the public key in GitHub as an authentication key.

## ✅ You Should Be Able To
- explain the difference between a private key and a public key
- create an `ed25519` SSH key pair
- use SSH to authenticate from your machine to GitHub

## 🧠 Key Ideas
- The **private key** stays on your machine.
- The **public key** can be shared safely.
- GitHub uses the public key to verify that your machine is allowed to connect.
- This step handles authentication. It does not sign commits yet.

## 1️⃣ Generate An SSH Key Pair
Run:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Accept the default path `~/.ssh/id_ed25519`. Use a passphrase if possible. A passphrase protects the private key if someone gets access to your machine.

## 2️⃣ Start `ssh-agent` And Load The Key
Run:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

`ssh-agent` keeps the private key available for authentication during your shell session.

## 3️⃣ Add The Public Key To GitHub
Print your public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Then:
1. copy the full output
2. open **GitHub -> Settings -> SSH and GPG keys**
3. click **New SSH key**
4. select **Authentication Key**
5. paste the public key and save

## 🧪 Verify
Run:

```bash
ssh-add -l
ssh -T git@github.com
```

You can also run the local repo check:

```bash
bash scripts/verify-setup.sh --check-github
```

## 🏁 Success Criteria
- `ssh-add -l` lists at least one loaded identity.
- `ssh -T git@github.com` reports successful authentication.
- You can explain that SSH authentication proves your machine can connect to GitHub, not that a commit is signed.

***
| [<- Previous: Configure Identity](03-configure-identity.md) | [Next: Enable Commit Signing ->](05-commit-signing.md) |
| :--- | ---: |
