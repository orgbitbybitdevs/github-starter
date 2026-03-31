# 🚀 Your First Commit

***
| [⬅️ Previous: Commit Signing](05-commit-signing.md) | [Next: Remotes and Cloning ➡️](07-remotes-and-cloning.md) |
| :--- | ---: |
***

**🎯 Learning Objective:** Learn the fundamental local loop: transitioning a file from an untracked state in your **Working Tree**, to the **Staging Area**, to an immutable snapshot in your **Commit History**.

## ⚙️ What it does
Git orchestrates files through three distinct operational states:
1. **Working Tree**: Your local directory where you actively create and modify files.
2. **Staging Area (Index)**: A conceptual waiting room. You explicitly stage changes here, telling Git exactly which modifications should be included in the next snapshot.
3. **Repository (Commit History)**: The `.git` database storing your permanent, encrypted snapshots (`commits`).

## 🧠 Why it exists
You rarely want every file modification, broken script, or temporary debug log grouped into a single save point. The explicit `Staging Area` allows you to logically bundle related changes together into a single, comprehensive `commit`.

## 📅 When to use it
We will practice this core workflow by creating a local project entirely from scratch.

**1. Initialize the Repository**
Create a new directory and run `git init`. This creates the hidden `.git` folder, officially turning the directory into a Git repository.
```bash
mkdir first-project
cd first-project
git init
```

**2. Make local edits (Working Tree)**
Create a single text file. At this phase, the file exists only in the Working Tree. It is untracked.
```bash
echo "Hello Git World! This is my first line of code." > index.txt
```

**3. Move modifications to the Staging Area (`git add`)**
Use `git status` to see untracked files, then explicitly add the file to the Index.
```bash
git status 
git add index.txt
```

**4. Record the Commit (`git commit`)**
Executing `commit` permanently writes the staged changes into the Repository history. Git attaches your `user.name` and applies your cryptographically secure SSH signature.
```bash
git commit -m "feat: added my first index file"
```

## ✅ How to verify

Read the repository's permanent ledger to verify the commit was saved:
```bash
git log
```

You should see your commit hash, authorship, timestamp, and message. The local core workflow loop is complete!

***
| [⬅️ Previous: Commit Signing](05-commit-signing.md) | [Next: Remotes and Cloning ➡️](07-remotes-and-cloning.md) |
| :--- | ---: |
