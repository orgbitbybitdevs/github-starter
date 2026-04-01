# 🩹 Troubleshooting

***
| [<- Previous: Branches, Forks, Origin, And Upstream](08-fork-origin-upstream.md) | [Next: Final Evaluation ->](10-final-evaluation.md) |
| :--- | ---: |
***

## 🎯 Outcome
Diagnose common Git, SSH, signing, and remote problems without guessing.

## ✅ You Should Be Able To
- decide whether a problem is about installation, authentication, signing, or remotes
- run a short triage checklist before changing settings
- apply a targeted fix instead of repeating setup steps blindly

## 🧰 Quick Triage Checklist
Run these commands first:

```bash
git --version
git config --global --list
ssh-add -l
git remote -v
bash scripts/verify-setup.sh
```

These checks usually tell you whether the problem is local Git configuration, SSH authentication, or remote configuration.

## 🚨 Problem: `git: command not found`
Git is not installed or is not available on your shell `PATH`.

Fix:
1. install Git again for your operating system
2. open a new terminal session
3. run `git --version`

## 🔐 Problem: `Permission denied (publickey)`
GitHub rejected the SSH connection. This is an authentication problem.

Fix:
1. check whether the key is loaded:

```bash
ssh-add -l
```

2. if needed, start `ssh-agent` and load the key again:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

3. confirm that the public key in `~/.ssh/id_ed25519.pub` is registered in GitHub as an **Authentication Key**
4. test again:

```bash
ssh -T git@github.com
```

## 🖋️ Problem: Commit shows `Unverified` on GitHub
This is a signing problem, not an authentication problem.

Check:
1. the commit was created after signing was enabled
2. `user.email` matches an email associated with your GitHub account
3. the public key was also added to GitHub as a **Signing Key**
4. these settings exist:

```bash
git config --global --get gpg.format
git config --global --get user.signingkey
git config --global --get commit.gpgsign
```

If the commit was created before signing was enabled, create a new signed commit.

## 🌐 Problem: Push asks for a password or token
Your remote is probably using HTTPS instead of SSH.

Check:

```bash
git remote -v
```

If the remote starts with `https://github.com/`, switch it to SSH:

```bash
git remote set-url origin git@github.com:username/repo.git
```

In this course, `origin` should usually point to your own copy of the template repository.

## 🌿 Problem: `src refspec main does not match any`
This usually means you do not have a commit on the branch yet, or you are pushing the wrong branch name.

Fix:
1. check the current branch:

```bash
git branch --show-current
```

2. create a commit if the repository is still empty
3. push the current branch explicitly:

```bash
git push -u origin <branch-name>
```

## 🏁 Success Criteria
- You can tell whether a failure is about auth, signing, or remote URLs.
- You can explain why `Permission denied (publickey)` and `Unverified` are different problems.
- You know which commands to run before changing your setup.

***
| [<- Previous: Branches, Forks, Origin, And Upstream](08-fork-origin-upstream.md) | [Next: Final Evaluation ->](10-final-evaluation.md) |
| :--- | ---: |
