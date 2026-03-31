# Install Git

## What it does
This step tells your computer how to speak the "Git" language. By installing it, your terminal (the command line) will be able to understand the commands we will use throughout this guide.

## Why it exists
Git doesn't come pre-installed on every computer. Because it's a tool primarily built for software developers, you have to download and install the engine so it runs seamlessly in the background.

## When to use it
If you run `git --version` in your terminal right now and get an error saying "command not found," you need to complete this installation step.

### Windows
The easiest way is to download the installer directly:
1. Go to [Git for Windows](https://git-scm.com/download/win).
2. Download the installer and run it. Keep clicking "Next" to accept all the default settings (they are perfect for beginners).

### macOS
Mac makes it very easy! Open your Terminal app and type:
```bash
git --version
```
If Git isn't installed, your Mac will automatically pop up a window asking if you want to install the "Command Line Developer Tools." Click "Install" and follow the prompts.

*(Alternative for advanced users: run `brew install git` if you use Homebrew).*

### Linux (Ubuntu/Debian)
Open your terminal and use the default Debian package manager:
```bash
sudo apt update
sudo apt install git -y
```

### Linux (Fedora/RHEL/CentOS)
If you use a RedHat-based distribution, use the DNF package manager instead:
```bash
sudo dnf install git -y
```

## How to verify

Once the installation finishes, close your terminal completely and open a **new** one. Then type:
```bash
git --version
```
If you see something like `git version 2.43.0`, congratulations! Your computer now speaks Git.
