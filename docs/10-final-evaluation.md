# 🏆 Practical Evaluation

***
| [⬅️ Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
***

**🎯 Learning Objective:** Combine all previous modules into the standard GitHub Flow. By completing this evaluation, you will demonstrate your ability to create a branch, stage files, secure your commits, and open a Pull Request subject to automated grading.

## 📝 The Challenge
Your objective is to execute a standard **GitHub Flow**. Do not push your changes directly to the `main` branch. 

### Step 1: Create a Branch
1. From the root directory of this repository, create a new branch. Replace `[username]` with your actual GitHub username:
   ```bash
   git switch -c feature/evaluation-[username]
   ```

### Step 2: Modify the Working Tree
1. Create a `students/` directory and add a new text file to it:
   ```bash
   mkdir -p students
   echo "I have completed the Git and GitHub starter course." > students/[username].md
   ```

### Step 3: Stage and Commit (`add` & `commit`)
1. Move your new file to the Staging area (Index) so Git tracks it:
   ```bash
   git add students/
   ```
2. Save your changes into the repository history with a clear commit message:
   ```bash
   git commit -m "docs: submit final evaluation file"
   ```

### Step 4: Push to Remote (`push`)
Upload your new branch to the GitHub remote repository:
```bash
git push -u origin feature/evaluation-[username]
```

### Step 5: Open a Pull Request
1. Open your web browser and navigate to this repository on GitHub.
2. GitHub will display a yellow banner showing your recent push. Click **"Compare & pull request"**.
3. Ensure the base branch is `main` and the compare branch is your new `feature/...` branch. 
4. Click **"Create pull request"**.

## ✅ Automated Autograding
This repository uses GitHub Actions for autograding. When you open your Pull Request, our bot will automatically run a script to verify:
1. You worked on a new branch, not `main`.
2. You successfully added a file to the `students/` folder.

If your Pull Request passes the checks, you will see a green checkmark ✅. Finally, check your commit on the GitHub UI to ensure it displays the green **"Verified"** badge confirming your SSH signature is working.

Congratulations! We look forward to seeing your Pull Request.

***
| [⬅️ Previous: Troubleshooting](09-troubleshooting.md) |
| :---: |
