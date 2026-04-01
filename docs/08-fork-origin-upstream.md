# Branches, Forks, Origin, And Upstream

***
| [<- Previous: Learn Remotes And Cloning](07-remotes-and-cloning.md) | [Next: Troubleshooting ->](09-troubleshooting.md) |
| :--- | ---: |
***

## Outcome
Know when to use a branch, when to use a fork, and what `origin` and `upstream` mean in a fork-based workflow.

## You Should Be Able To
- explain the difference between a branch and a fork
- identify when `origin` points to your fork
- add the original repository as `upstream`

## Key Ideas
- A **branch** is a pointer inside one repository.
- A **fork** is a separate repository created on GitHub under another account or organization.
- In a fork workflow, `origin` usually points to your fork and `upstream` points to the original repository.

## When To Use A Branch
Use a branch when you already have write access to the repository and want to isolate work from `main`.

Example:

```bash
git switch -c feature/profile-page
```

## When To Use A Fork
Use a fork when you do not have direct write access to the original repository, or when a project expects contributions through personal copies.

Typical flow:
1. fork the repository on GitHub
2. clone your fork
3. add the original repository as `upstream`
4. push your work to your fork
5. open a pull request back to the original repository

## Configure `upstream`
Clone your fork:

```bash
git clone git@github.com:your-username/the-forked-repo.git
cd the-forked-repo
```

Add the original repository as `upstream`:

```bash
git remote add upstream git@github.com:original-owner/the-repo.git
```

Fetch updates from the original repository:

```bash
git fetch upstream
```

## Verify
Run:

```bash
git remote -v
```

Expected output includes both remotes:

```text
origin    git@github.com:your-username/the-forked-repo.git (fetch)
origin    git@github.com:your-username/the-forked-repo.git (push)
upstream  git@github.com:original-owner/the-repo.git (fetch)
upstream  git@github.com:original-owner/the-repo.git (push)
```

## Success Criteria
- You can explain why a branch stays inside one repository while a fork creates a second repository.
- You can explain what `origin` and `upstream` each point to in a fork workflow.
- You can add `upstream` without deleting `origin`.

***
| [<- Previous: Learn Remotes And Cloning](07-remotes-and-cloning.md) | [Next: Troubleshooting ->](09-troubleshooting.md) |
| :--- | ---: |
