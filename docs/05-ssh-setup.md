# 🔐 Setup SSH Authentication

***
| [⬅️ Previous: Commit Signing](04-commit-signing.md) | [Next: Create or Clone a Repository ➡️](06-create-clone-repo.md) |
| :--- | ---: |
***

## ⚙️ What it does
Imagine going to a very strict office building every day. Instead of forcing you to write down your password every time you walk through the door, the security guard gives you a unique VIP badge that unlocks the gate automatically. That VIP badge is an **SSH Key**.

```mermaid
graph LR
    A[Your Laptop\n(Private ID Card)] -- "Magically unlocks" --> B((GitHub\nHas a picture of your ID))
```

## 🧠 Why it exists
In the past, you had to type your GitHub password every single time you tried to upload code. This was terribly annoying and potentially unsafe if someone was looking over your shoulder. GitHub solved this friction by using "Public-Key Cryptography." You generate two keys that fit together perfectly: one stays securely hidden on your laptop, and you give the other one to GitHub. 

## 📅 When to use it
You only have to generate a VIP badge **once** per laptop! As soon as you install Git, setting this up makes your life a hundred times easier.

**Step 1: Create your VIP Badge**
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
Press **Enter** to accept the default file location when it asks. You can just hit **Enter** again twice if you don't want to type a local password for the file.

**Step 2: Give GitHub a picture of your Badge**
We need to copy the public half of your badge so GitHub knows what to look for when your laptop connects. To print the code out in your terminal:
```bash
cat ~/.ssh/id_ed25519.pub
```
Copy everything the terminal spits out (it should start with `ssh-ed25519`). Then, go to your **GitHub Account > Settings > SSH and GPG keys**, click **New SSH key**, and paste it there!

## ✅ How to verify

To check if the security guard recognizes you, ask Git to test the connection:
```bash
ssh -T git@github.com
```

If it replies with `Hi [username]! You've successfully authenticated...`, your VIP badge works perfectly!

***
| [⬅️ Previous: Commit Signing](04-commit-signing.md) | [Next: Create or Clone a Repository ➡️](06-create-clone-repo.md) |
| :--- | ---: |
