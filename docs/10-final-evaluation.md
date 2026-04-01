# Final Evaluation

***
| [<- Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
***

## Outcome
Demonstrate a complete beginner GitHub Flow: create a branch, add a file, create a signed commit, push it, and open a pull request that passes automated grading.

## You Should Be Able To
- create a feature branch from `main`
- add one file under `students/`
- create a signed commit with the required message
- open a pull request to `main`
- explain `git add`, authentication vs signing, and `origin`

## Evaluation Rules
Your submission must follow all of these rules:

1. the branch must be named `feature/evaluation-[username]`
2. the pull request must target `main`
3. the only changed file must be `students/[username].md`
4. the latest commit message must be `docs: submit final evaluation`
5. the latest commit must be signed

## Step 1: Create The Branch
From the root of the repository, run:

```bash
git switch -c feature/evaluation-[username]
```

Replace `[username]` with your GitHub username.

## Step 2: Create The Submission File
Create `students/[username].md` and paste this template:

```md
# GitHub Starter Evaluation
GitHub username: [username]

What `git add` does:
- Replace this line with your explanation.

Authentication vs signing:
- Replace this line with your explanation.

What `origin` points to in this repository:
- Replace this line with your explanation.
```

Replace `[username]` with your GitHub username and write your own answers.

## Step 3: Stage And Commit
Run:

```bash
git add students/[username].md
git commit -m "docs: submit final evaluation"
```

If Git signing is configured correctly, this commit will be signed automatically.

## Step 4: Push The Branch
Run:

```bash
git push -u origin feature/evaluation-[username]
```

## Step 5: Open The Pull Request
1. open the repository on GitHub
2. click **Compare & pull request**
3. confirm that the base branch is `main`
4. create the pull request

## What The Autograder Checks
GitHub Actions will verify:
- the pull request targets `main`
- the branch name matches `feature/evaluation-[username]`
- exactly one file was added: `students/[username].md`
- the file contains the required reflection sections
- the latest commit message is correct
- the latest commit contains a cryptographic signature

## Final Manual Check
After the workflow passes, open the latest commit on GitHub and confirm that it shows `Verified`.

## Success Criteria
- GitHub Actions passes on the pull request.
- The latest commit shows `Verified` on GitHub.
- You can explain each answer in your submission file without reading from the docs.

***
| [<- Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
