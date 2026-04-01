# 🏆 Final Evaluation

***
| [<- Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
***

## 🎯 Outcome
Demonstrate a complete beginner GitHub Flow inside your own copy of this template: create a branch, add a file, create a signed commit, push it, and open a pull request that passes automated grading.

[![See PR Results](https://img.shields.io/badge/See-PR%20Results-8250df?style=for-the-badge)](#see-pr-results)

## ✅ You Should Be Able To
- create a feature branch from `main`
- add one file under `students/`
- create a signed commit with the required message
- open a pull request to `main`
- explain `git add`, authentication vs signing, and `origin`

## 📋 Evaluation Rules
Your submission must follow all of these rules:

1. the branch must be named `feature/evaluation-[username]`
2. the pull request must target `main`
3. the only changed file must be `students/[username].md`
4. the latest commit message must be `docs: submit final evaluation`
5. the latest commit must be signed

This evaluation happens in your own repository copy created from the template. Do not open the pull request in the academy source repository.

## 1️⃣ Create The Branch
From the root of your own repository copy, run:

```bash
git switch -c feature/evaluation-[username]
```

Replace `[username]` with your GitHub username.

## 2️⃣ Create The Submission File
Create `students/[username].md` and paste this template:

```md
# GitHub Starter Evaluation
GitHub username: [username]

What `git add` does:
- Replace this line with your explanation.

Authentication vs signing:
- Replace this line with your explanation.

What `origin` points to in your copy of this template:
- Replace this line with your explanation.
```

Replace `[username]` with your GitHub username and write your own answers.

## 3️⃣ Stage And Commit
Run:

```bash
git add students/[username].md
git commit -m "docs: submit final evaluation"
```

If Git signing is configured correctly, this commit will be signed automatically.

## 4️⃣ Push The Branch
Run:

```bash
git push -u origin feature/evaluation-[username]
```

## 5️⃣ Open The Pull Request
1. open your own repository copy on GitHub
2. click **Compare & pull request**
3. confirm that the base branch is `main`
4. create the pull request

## 🤖 What The Autograder Checks
GitHub Actions will verify:
- the pull request targets `main`
- the branch name matches `feature/evaluation-[username]`
- exactly one file was added: `students/[username].md`
- the file contains the required reflection sections
- the latest commit message is correct
- the latest commit contains a cryptographic signature

Because this repository is a template, the workflow runs inside your copy after GitHub copies the `.github` and `scripts/` files.

<a id="see-pr-results"></a>
## 👀 Final Manual Check
After the workflow passes, open the latest commit on GitHub and confirm that it shows `Verified`.

To read the grader results:
1. open your pull request
2. look at the status box near the top
3. click **Checks**
4. open **Final Evaluation Autograding**
5. read the `PASS` or `FAIL` output from the workflow log

## 🏁 Success Criteria
- GitHub Actions passes on the pull request.
- The latest commit shows `Verified` on GitHub.
- You can explain each answer in your submission file without reading from the docs.

***
| [<- Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
