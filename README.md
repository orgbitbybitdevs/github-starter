# 🚀 Git & GitHub Starter

Git & GitHub Starter is a guided beginner course for setting up Git correctly and understanding the workflow behind everyday GitHub collaboration.

## 🗺️ Official Course Index
This `README.md` is the single source of navigation for the course.

- `README.md`: course map and entrypoint
- `docs/`: lesson content
- `START_HERE.md`: legacy redirect for older links

## 🧩 Template Model
This repository is designed to be used as a GitHub template.

- The academy repository stays clean and protected as the source course.
- Each learner clicks **Use this template** and creates a personal copy.
- The learner clones their own copy, works on branches there, and opens pull requests in that copy.
- The workflows and scripts in this repo are copied too, so autograding works inside the learner's repository.

## 🧰 Prerequisites
- Basic terminal usage
- A free GitHub account

## ▶️ How To Use This Repo
1. Click **Use this template** on GitHub and create your own copy of this repository.
2. Clone your copy to your machine.
3. Start with module 01 and follow the modules in order.
4. After modules 02 to 05, run `bash scripts/verify-setup.sh` in your local copy.
5. Complete the final evaluation in module 10 on a feature branch in your copy.
6. Open a pull request in your copy of the repository and wait for GitHub Actions feedback.

## 📚 Course Map
1. [docs/01-introduction.md](docs/01-introduction.md) - Understand version control, Git, and GitHub.
2. [docs/02-install-git.md](docs/02-install-git.md) - Install Git and set `main` as the default branch name for new repositories.
3. [docs/03-configure-identity.md](docs/03-configure-identity.md) - Configure author identity and separate it from authentication and signing.
4. [docs/04-ssh-setup.md](docs/04-ssh-setup.md) - Generate an SSH key pair and use it for GitHub authentication.
5. [docs/05-commit-signing.md](docs/05-commit-signing.md) - Enable SSH commit signing and understand what GitHub verifies.
6. [docs/06-first-commit.md](docs/06-first-commit.md) - Practice the working directory -> staging area -> commit history loop.
7. [docs/07-remotes-and-cloning.md](docs/07-remotes-and-cloning.md) - Learn what a remote is, why `origin` exists, and how `fetch` differs from `pull`.
8. [docs/08-fork-origin-upstream.md](docs/08-fork-origin-upstream.md) - Distinguish branches from forks and configure `upstream`.
9. [docs/09-troubleshooting.md](docs/09-troubleshooting.md) - Diagnose common Git, SSH, signing, and remote errors.
10. [docs/10-final-evaluation.md](docs/10-final-evaluation.md) - Complete a graded GitHub Flow exercise with automated checks in your template copy.

## 🏁 By The End Of This Course
You should be able to:
- install and verify Git on your machine
- configure `user.name`, `user.email`, and default branch settings
- authenticate to GitHub with SSH
- sign commits with SSH and understand the `Verified` badge
- explain the difference between the working directory, staging area, and commit history
- clone repositories, inspect remotes, and explain `origin` and `upstream`
- complete a branch-based pull request workflow in your own template copy that passes automated grading

## 🤖 Automation In This Repo
- `scripts/verify-setup.sh` checks local Git, SSH, and signing configuration.
- `.github/workflows/autograding.yml` runs the final evaluation checks on pull requests in each learner's copy.
- `scripts/grade-pr.sh` enforces the final evaluation rules.
