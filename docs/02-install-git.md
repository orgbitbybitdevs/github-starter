# 💻 Install Git

***
| [<- Previous: Introduction](01-introduction.md) | [Next: Configure Your Git Identity ->](03-configure-identity.md) |
| :--- | ---: |
***

## 🎯 Outcome
Install Git on your machine and set `main` as the default branch name for new repositories.

## ✅ You Should Be Able To
- install Git on your operating system
- confirm that your terminal can run `git`
- explain what `init.defaultBranch` controls

## 🧠 Key Ideas
- Git is a local command-line tool. It must be installed before you can use it.
- `git init` creates a new repository on your machine.
- `init.defaultBranch` sets the default branch name for future repositories you initialize locally.

## 📥 Install Git
Choose the instructions for your operating system.

### Windows
1. Go to [Git for Windows](https://git-scm.com/download/win).
2. Download the installer and complete the installation with the default settings.

### macOS
Open Terminal and run:

```bash
git --version
```

If Git is not installed, macOS usually prompts you to install the Command Line Tools.

### Linux
On Debian or Ubuntu:

```bash
sudo apt update
sudo apt install git -y
```

On Fedora or RHEL:

```bash
sudo dnf install git -y
```

## 🌿 Set The Default Branch Name
Run this once:

```bash
git config --global init.defaultBranch main
```

This affects repositories you create later with `git init`.

## 🧪 Verify
Open a new terminal session and run:

```bash
git --version
git config --global --get init.defaultBranch
```

## 🏁 Success Criteria
- `git --version` prints an installed version instead of an error.
- `git config --global --get init.defaultBranch` prints `main`.
- You can explain that this setting affects new repositories, not every existing repository.

***
| [<- Previous: Introduction](01-introduction.md) | [Next: Configure Your Git Identity ->](03-configure-identity.md) |
| :--- | ---: |
