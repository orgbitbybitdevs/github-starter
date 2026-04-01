# Configure Your Git Identity

***
| [<- Previous: Install Git](02-install-git.md) | [Next: Set Up SSH Authentication ->](04-ssh-setup.md) |
| :--- | ---: |
***

## Outcome
Configure the name and email Git writes into your commits, and separate identity metadata from authentication and signing.

## You Should Be Able To
- set `user.name` and `user.email`
- explain what author metadata is
- explain why author identity is not the same as authentication

## Key Ideas
- `user.name` and `user.email` are written into commit metadata.
- These values identify the author of a commit, but they do not prove that the author is really you.
- Authentication answers "can this machine connect to GitHub?"
- Signing answers "was this commit cryptographically signed by a registered key?"

## Configure Your Name And Email
Run these commands once on your machine:

```bash
git config --global user.name "Your First and Last Name"
git config --global user.email "your_email@example.com"
```

Use an email address that is associated with your GitHub account. That helps GitHub attribute your commits correctly.

## Identity vs Authentication vs Signing
- **Identity metadata** is the name and email stored in the commit.
- **Authentication** is how GitHub decides whether your machine is allowed to push.
- **Signing** is how a commit proves it was signed with a key registered to an account.

These are three related but different concepts.

## Verify
Run:

```bash
git config --global --get user.name
git config --global --get user.email
```

## Success Criteria
- Both commands print values instead of empty output.
- You can explain why setting `user.email` alone does not let you push to GitHub.
- You can explain why GitHub attribution and commit verification are related, but not identical.

***
| [<- Previous: Install Git](02-install-git.md) | [Next: Set Up SSH Authentication ->](04-ssh-setup.md) |
| :--- | ---: |
