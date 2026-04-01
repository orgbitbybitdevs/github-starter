# 🕰️ Introduction to Git and GitHub

***
| [Next: Install Git ->](02-install-git.md) |
| :---: |
***

## 🎯 Outcome
Understand what version control is, what Git does locally, and what GitHub adds on top.

## ✅ You Should Be Able To
- explain the difference between Git and GitHub
- describe why version control matters even on small projects
- identify `.git` as the local history database for a repository

## 🧠 Key Ideas
- Git is a distributed version control system that runs on your machine.
- GitHub is a platform that hosts Git repositories and adds collaboration features.
- A commit is a saved project snapshot plus metadata such as author, timestamp, and message.
- The `.git` directory stores repository history, references, and configuration for the project.

## ⚖️ Git vs GitHub
Git and GitHub are related, but they are not the same tool.

- **Git** tracks file changes locally. You can use it without an internet connection.
- **GitHub** hosts Git repositories remotely so people can share code, review changes, and open pull requests.

## 💡 Why Version Control Matters
Without version control, teams often create folders such as `project-final`, `project-final-v2`, and `project-final-really-final`. That approach loses history and makes collaboration hard.

Git solves that problem by recording a structured history of commits. Each commit points to a project snapshot, so you can inspect what changed, when it changed, and who made the change.

## 🛠️ Preview Of The Workflow
Throughout this course, you will learn a basic Git workflow:

1. change files in the working directory
2. stage selected changes with `git add`
3. create a commit with `git commit`
4. push the commit to GitHub

## 🧪 Verify
In the next module you will install Git and confirm that your shell can run it:

```bash
git --version
```

## 🏁 Success Criteria
- You can explain Git in one sentence without mentioning GitHub.
- You can explain GitHub in one sentence without calling it "Git".
- You know that repository history lives in `.git`.

***
| [Next: Install Git ->](02-install-git.md) |
| :---: |
