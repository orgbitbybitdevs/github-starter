# BitByBit Academy Step 3: Open your practice pull request

This step gives you an auto-graded practice run before the final evaluation.

## Read First
- [Module 06: First commit]({{repo_url}}/blob/main/docs/06-first-commit.md)
- [Module 07: Remotes and cloning]({{repo_url}}/blob/main/docs/07-remotes-and-cloning.md)

## Your Task
Create a practice pull request in your own template copy.

1. create a branch named `feature/practice-[username]`
2. add a new file `practice/[username].md`
3. use this template:

```md
# Practice Check
GitHub username: [username]

What I verified locally:
- Replace this line with your summary.

What `origin` points to in my template copy:
- Replace this line with your explanation.
```

4. commit with the exact message `docs: submit practice check`
5. make sure the latest commit is signed
6. push the branch and open a pull request to `main`

## What GitHub Will Check
- the branch name matches `feature/practice-[username]`
- the pull request targets `main`
- exactly one file was added: `practice/[username].md`
- the file contains the required headings
- the latest commit message is correct
- the latest commit is signed

Passing means you can complete the core GitHub flow on your own copy before the graded final.
Failing means the workflow found a specific rule that still needs to be fixed.

## When You Finish
1. wait for the workflow named **Practice Pull Request Check**
2. confirm it passes
3. close this issue

When this issue is closed, the final evaluation issue will be created automatically.
