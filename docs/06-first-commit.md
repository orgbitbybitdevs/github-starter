# Make Your First Commit

***
| [<- Previous: Enable Commit Signing](05-commit-signing.md) | [Next: Learn Remotes And Cloning ->](07-remotes-and-cloning.md) |
| :--- | ---: |
***

## Outcome
Practice the local Git loop: working directory -> staging area -> commit history.

## You Should Be Able To
- explain the difference between the working directory, staging area, and commit history
- create a repository with `git init`
- stage a file and create a commit

## Key Ideas
- The **working directory** is where you edit files.
- The **staging area** is the set of changes selected for the next commit.
- The **commit history** is the permanent record stored in `.git`.
- A commit object stores a snapshot reference, parent reference, author and committer metadata, a message, and optionally a signature.

## Step 1: Create A Repository

```bash
mkdir first-project
cd first-project
git init
```

## Step 2: Create A File In The Working Directory

```bash
echo "Hello Git World! This is my first line of code." > index.txt
```

At this point, the file exists on disk but is not part of a commit yet.

## Step 3: Stage The File

```bash
git status
git add index.txt
git status
```

After `git add`, the file moves from "untracked" to "staged" in Git's view of the next commit.

## Step 4: Create The Commit

```bash
git commit -m "feat: add first index file"
```

If signing is configured, Git signs the commit when it creates it.

## Verify
Run:

```bash
git status
git log --oneline -1
```

## Success Criteria
- `git status` reports a clean working tree after the commit.
- `git log --oneline -1` shows the new commit.
- You can explain what `git add` changed before `git commit` was run.

***
| [<- Previous: Enable Commit Signing](05-commit-signing.md) | [Next: Learn Remotes And Cloning ->](07-remotes-and-cloning.md) |
| :--- | ---: |
