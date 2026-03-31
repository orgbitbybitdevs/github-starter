# 💻 Install Git

***
| [⬅️ Previous: Introduction](01-introduction.md) | [Next: Configure your Git identity ➡️](03-configure-identity.md) |
| :--- | ---: |
***

**🎯 Learning Objective:** You will install the core Git binaries and configure your first professional convention: setting default repositories to initialize using the `main` branch.

## ⚙️ What it does
This step downloads the core Git engine, ensuring your `Terminal` can parse and execute version control CLI commands.

## 🧠 Why it exists
Git must be locally compiled or installed to track revisions on your personal machine. It acts identically whether your project ever connects to the internet or stays completely offline.

## 📅 When to use it
If you run `git --version` in your terminal and get an error (e.g., `command not found`), proceed below.

### Windows
1. Go to [Git for Windows](https://git-scm.com/download/win).
2. Download the installer. Keep clicking "Next" to accept all the default settings (they are perfect for developers).

### macOS
Open your Terminal app and type:
```bash
git --version
```
If Git isn't installed, a native window will ask to install the "Command Line Developer Tools." Click "Install".

### Linux (Ubuntu/Debian/Fedora)
For Debian architectures:
```bash
sudo apt update
sudo apt install git -y
```
For RHEL/Fedora architectures:
```bash
sudo dnf install git -y
```

## 🛠️ Professional Convention: Branch naming
Historically, Git named the default "trunk" branch `master`. The industry has modernized to use `main`. Run this strictly once to configure your future local repositories professionally:

```bash
git config --global init.defaultBranch main
```

## ✅ How to verify

Spin up a **new** terminal session to ensure the binaries loaded into your `PATH`, and type:
```bash
git --version
```
If you see a version output, your environment is ready!

***
| [⬅️ Previous: Introduction](01-introduction.md) | [Next: Configure your Git identity ➡️](03-configure-identity.md) |
| :--- | ---: |
