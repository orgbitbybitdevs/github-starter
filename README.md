# 🚀 Git & GitHub Starter

BitByBit Academy presents a guided beginner course for setting up Git correctly and understanding the workflow behind everyday GitHub collaboration.

## 🚀 START HERE (MANDATORY)
If you only read one section before doing anything, read this one.

1. Click **Use this template** and create your own repository copy.
2. Open the **Actions** tab in your copy.
3. Run **Initialize Interactive Course**.
4. Open the first issue that BitByBit Academy creates for you.

This is the fastest and clearest way to start the course correctly.

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
4. After module 04, run the authentication check in your local copy.
5. After module 05, run the full setup check in your local copy.
6. Complete the final evaluation in module 10 on a feature branch in your copy.
7. Open a pull request in your copy of the repository and wait for GitHub Actions feedback.

## 🧠 Interactive Mode
Use the interactive issue flow in your own template copy for the full BitByBit Academy experience.

[![Initialize Interactive Course](https://img.shields.io/badge/Start-Interactive%20Course-f97316?style=for-the-badge)](#initialize-interactive-course)

The interactive mode does this:
- creates the first course issue automatically
- opens the next issue when you close the current one
- gives you incremental checkpoints before the final evaluation
- uses GitHub Actions to grade practice and final pull requests

## ⚡ Quick Actions
[![Run Authentication Check](https://img.shields.io/badge/Run-Authentication%20Check-2ea44f?style=for-the-badge)](#run-auth-check)
[![Run Full Setup Check](https://img.shields.io/badge/Run-Full%20Setup%20Check-0969da?style=for-the-badge)](#run-full-check)
[![See PR Results](https://img.shields.io/badge/See-PR%20Results-8250df?style=for-the-badge)](#see-pr-results)

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

<a id="initialize-interactive-course"></a>
## 🧭 Initialize The Interactive Course
In your own template copy on GitHub:

1. open the **Actions** tab
2. select **Initialize Interactive Course**
3. click **Run workflow**
4. open the issue that gets created automatically

The guided issue sequence is:
1. verify SSH authentication
2. verify commit signing
3. open a practice pull request
4. complete the final evaluation
5. receive the completion issue

<a id="run-auth-check"></a>
## 🧪 Run The Authentication Check Now
Open a terminal in the root of your template copy and run one command:

macOS/Linux:

```bash
bash scripts/run-auth-check.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-auth-check.ps1
```

Windows Command Prompt:

```bat
scripts\run-auth-check.cmd
```

Use this after module 04. It checks Git, identity, SSH key material, `ssh-agent`, and GitHub authentication. It intentionally skips commit-signing checks.

<a id="run-full-check"></a>
## 🛡️ Run The Full Setup Check Now
Open a terminal in the root of your template copy and run one command:

macOS/Linux:

```bash
bash scripts/run-full-check.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run-full-check.ps1
```

Windows Command Prompt:

```bat
scripts\run-full-check.cmd
```

Use this after module 05. It checks everything from the authentication check plus SSH commit-signing configuration.

## 📊 How To Read The Results
- `PASS` means the check succeeded.
- `WARN` means the course can continue, but something still needs attention.
- `FAIL` means you should fix that item before moving on.

The scripts print the results directly in your terminal.

## 🔍 What Each Action Validates
BitByBit Academy uses different checks for different learning goals.

- **Authentication Check** validates Git installation, identity, SSH key material, `ssh-agent`, and GitHub SSH access.
- **Full Setup Check** validates everything in the authentication check plus SSH commit-signing configuration.
- **Practice Pull Request Check** validates your branch naming, target branch, changed file, commit message, and signed commit.
- **Final Evaluation Autograding** validates the graded submission file, branch naming, target branch, commit message, signed commit, and pull request structure.

Passing means your current step meets the technical rules for that stage.
Failing means the workflow found a concrete requirement that still needs to be fixed.

<a id="see-pr-results"></a>
## ✅ See Your PR Results
When you open a course pull request in your own template copy, GitHub runs the grading workflow automatically.

You can see the results in two places:
1. under the status area at the top of the pull request
2. in the **Checks** tab of the pull request

You should see one of these workflows:
- **Practice Pull Request Check**
- **Final Evaluation Autograding**

Open the workflow result to see the detailed `PASS` or `FAIL` output from the grader.

BitByBit Academy also posts mentor-style feedback on the pull request so the learner sees:
- what the workflow checked
- whether the current step passed
- where to look next if it failed

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
- `.github/workflows/initialize-course.yml` creates the first interactive course issue on demand.
- `.github/workflows/course-progress.yml` opens the next course issue when you close the current step.
- `.github/workflows/practice-autograding.yml` grades the practice pull request.
- `scripts/run-auth-check.sh`, `scripts/run-auth-check.ps1`, and `scripts/run-auth-check.cmd` run the authentication-stage checks.
- `scripts/run-full-check.sh`, `scripts/run-full-check.ps1`, and `scripts/run-full-check.cmd` run the full setup checks.
- `scripts/verify-setup.sh` and `scripts/verify-setup.ps1` are the underlying cross-platform setup validators.
- `.github/workflows/autograding.yml` runs the final evaluation checks on pull requests in each learner's copy.
- `scripts/grade-practice-pr.sh` enforces the practice pull request rules.
- `scripts/grade-pr.sh` enforces the final evaluation rules.
