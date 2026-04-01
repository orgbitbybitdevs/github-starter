# 📡 Learn Remotes And Cloning

***
| [<- Previous: Make Your First Commit](06-first-commit.md) | [Next: Branches, Forks, Origin, And Upstream ->](08-fork-origin-upstream.md) |
| :--- | ---: |
***

## 🎯 Outcome
Understand what a remote is, why `origin` exists, and how `clone`, `fetch`, and `pull` relate to each other in your own copy of this template.

## ✅ You Should Be Able To
- explain that a remote is a stored URL plus a local alias
- clone a repository over SSH
- explain the difference between `git fetch` and `git pull`

## 🧠 Key Ideas
- A **remote** is a named connection to another copy of the repository.
- `origin` is the default alias Git creates for the source URL when you run `git clone`.
- `git fetch` downloads new remote data without changing your working branch.
- `git pull` is usually `fetch` followed by integrating those changes into your current branch.

## 📥 Clone A Repository
For this course, you should usually clone your own template-generated repository, not the academy source repository.

Copy the SSH URL of your own repository and run:

```bash
git clone git@github.com:username/repo-name.git
cd repo-name
```

After cloning, Git stores the source URL under the alias `origin`. In this course, `origin` should usually point to your own copy of the template.

If you cloned your copy with HTTPS earlier because SSH was not configured yet, you can switch `origin` to SSH now:

```bash
git remote set-url origin git@github.com:your-username/your-repo-name.git
git remote -v
```

## 🔎 Inspect The Remote
Run:

```bash
git remote -v
```

Expected output looks like this:

```text
origin  git@github.com:username/repo-name.git (fetch)
origin  git@github.com:username/repo-name.git (push)
```

## ⚖️ Fetch vs Pull
Use `fetch` when you want to download updates first and inspect them before changing your current branch:

```bash
git fetch origin
```

Use `pull` when you want to download and integrate updates into the branch you currently have checked out:

```bash
git pull origin main
```

## 🧪 Verify
Run:

```bash
git remote -v
```

## 🏁 Success Criteria
- You can explain `origin` as a local nickname for a remote URL.
- You can explain why `fetch` is safer when you want to inspect changes first.
- You can identify that `origin` in this course normally points to your own repository copy.

***
| [<- Previous: Make Your First Commit](06-first-commit.md) | [Next: Branches, Forks, Origin, And Upstream ->](08-fork-origin-upstream.md) |
| :--- | ---: |
