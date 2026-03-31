# 🏷️ Configure your Git identity

***
| [⬅️ Previous: Install Git](02-install-git.md) | [Next: Commit Signing ➡️](04-commit-signing.md) |
| :--- | ---: |
***

## ⚙️ What it does
This setup acts like a "Name Tag" for your code. Whenever you take a snapshot of your project (called a "commit"), Git permanently attaches your name and email to that snapshot so everyone knows you wrote it.

```mermaid
graph LR
    A[Your Code] + B[Your Name] + C[Your Email] --> D[(Git Commit Snapshot)]
```

## 🧠 Why it exists
Git was built for teams. When 10 people are working on the same project, you need a way to see exactly who added a brilliant new feature or who broke the website. Setting your identity ensures you get credit for your hard work!

> [!CAUTION]
> **Name Tag vs Password:** This step only sets your *Name Tag*. It does NOT give you a password to log into GitHub. Anyone could technically write your email on their Name Tag. In the next steps, we will secure your account so nobody can pretend to be you.

## 📅 When to use it
You only have to do this once per computer! You tell Git your global identity, and it remembers it for all your future projects.

Copy these commands into your terminal, replacing the text in quotes with your actual information:
```bash
git config --global user.name "Your First and Last Name"
git config --global user.email "your_email@example.com"
```
*(Make sure to use the exact email address you used to sign up for GitHub!)*

## ✅ How to verify

Let's ask Git to read back our Name Tag to make sure it saved properly:
```bash
git config --global --list
```
Look through the text that pops up. If you see your name and email, you are perfectly configured.

***
| [⬅️ Previous: Install Git](02-install-git.md) | [Next: Commit Signing ➡️](04-commit-signing.md) |
| :--- | ---: |
