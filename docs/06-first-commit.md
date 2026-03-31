# 🚀 Your First Commit

***
| [⬅️ Previous: Commit Signing](05-commit-signing.md) | [Next: Remotes and Cloning ➡️](07-remotes-and-cloning.md) |
| :--- | ---: |
***

**🎯 Learning Objective:** Learn the fundamental local loop: transitioning a file from an untracked state in your Working Tree, to the Staging area, to an immutable snapshot historically tracked in your Repository.

## ⚙️ What it does
Git orchestrates files through three core distinct states:
1. **Working Tree**: Your normal system folder where modifying files happens playfully. 
2. **Staging Area (Index)**: A conceptual waiting room where you tell Git, "I want *exactly these* file modifications to be evaluated in my next snapshot."
3. **Repository (Commit History)**: The hidden `.git` brain safely storing the final encrypted snapshots.

## 🧠 Why it exists
You don't want every accidental keystroke or broken debug log pushed directly to your team's code base. The deliberate isolation between Staging and Commit forces you to bundle logical, working features together thoughtfully.

## 📅 When to use it
We will practice the loop on a local scaffolding folder. 

**1. Create a workspace natively (Working Tree)**
```bash
mkdir first-project
cd first-project
# Tell Git to wake up and initiate the hidden .git Repository architecture here
git init
```

**2. Make local edits**
```bash
echo "Hello Git World! This is my first line of code." > index.txt
```

**3. Move modifications to the Staging Area (`git add`)**
```bash
# Check the immediate state of your tree
git status 

# Stage the file explicitly
git add index.txt
```

**4. Cement the tracking node (`git commit`)**
Here, Git evaluates your `user.name`, builds a cryptographic hash, attaches your `user.signingkey` (Wax Seal), and creates the snapshot!
```bash
git commit -m "feat: added my first index file"
```

## ✅ How to verify

Request the local repository strictly read your historical ledger out loud using:
```bash
git log
```

You should see your commit hash, authorship, timestamp, and message cleanly printed out. The initial mental loop is complete!

***
| [⬅️ Previous: Commit Signing](05-commit-signing.md) | [Next: Remotes and Cloning ➡️](07-remotes-and-cloning.md) |
| :--- | ---: |
