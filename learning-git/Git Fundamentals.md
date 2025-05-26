# **GIT FUNDAMENTALS**
*It is easy to shoot your foot off with git, but also easy to revert to a previous foot and merge it with your current leg*

## **Creating a repository and Linking it locally**

After downloading git and creating a repository on Github, enter:
`git config --global user.name "Amir-Beile"`
`git config --global user.email "amirbile@gmail.com"`

In order to link your local terminal to your github account, you'll need to generate a SSH key. Paste the text below, replacing the email used in the example with your GitHub email address and follow the steps in your terminal:
```
ssh-keygen -t rsa -b 4096 -C "enterYourEmailHere"
```

## **Git Workflow**

1. `git clone https...` - Clone your repository from GitHub.
2. `cd repository_name` - Navigate into your repository.
3. `git checkout -b file/branch_name` - Create a new branch for your feature.
4. Make your changes 
5. `git add .` - stage changes.
6. `git commit -m "descripton of changes"` - Commit changes.
7. `git push file/branch_name` - Push changes onto github.
`git status` - File tracking.

## **Understanding Commits**

A **commit** on GitHub is like saving a snapshot of your project at a specific point in time. It captures changes made to your files and includes:

- **Message**: A short description of the changes (e.g., "Fixed login bug").
- **Unique ID (SHA)**: A unique identifier for each commit.
- **Metadata**: Information like the author and timestamp of the commit.

### Why Commits Matter:
1. **Revert to Previous Versions**: You can go back to earlier versions of your project if required.
2. **Collaborate Effectively**: Merging changes from different contributors is easier.
3. **Document Progress**: Each commit creates a clear record of the updates and changes in your project.

Commits are the foundation of version control, allowing you to manage and track the history of your project.

Good commit practices include:
- Comitting often
- Clear commit messages 
- Using command style in messages
- Testing before comitting
- Avoiding comitting general files
- Break down large changes
- Consistent message styles
- References

## **Branching**

Branching lets you create separate versions of your project to work on different tasks without affecting the main codebase.

### **Key Points of branching**

- **Main Branch**: The default branch, usually called `main` or `master`, contains the stable version of your project.
- **Feature/development Branches**: Create new branches for specific tasks like adding features or fixing bugs (e.g., `new-feature` or `bugfix-bugname`).
- **Parallel Work**: Multiple developers can work on different branches simultaneously.
- **Merging**: Once your work is complete, merge the branch back into `main` or a `test` branch (for review) through a pull request. In some cases where there are small bugs, a `hotfix` branch is enough.
- **Isolation**: Changes in one branch do not affect the other branches until they are merged.

### **Branch Workflow Overview**

This workflow is designed to manage development, testing, and deployment for a collaborative project.

### **Branches**

- **`main`**/**`master`**: Stable, production-ready branch. 
- **`hotfix`**/**`bugfix`**: Branches for critical or bug fixes in production (e.g., `hotfix/critical-patch`).
- **`release`**: Branches for preparing a release (e.g., `release-Amir/v3.2.1`).
- **`develop`**: Integration branch for ongoing development.
- **`feature`**: Branches for new features (e.g., `feature/add-Amir-Site`).
- bugfix: Branches for bug fixes (e.g., `bugfix/fix-login-error`).
- hotfix: Branches for critical fixes in production (e.g., `hotfix/critical-patch`).

## **Pull Requests**

A Git **pull** request is a request to merge code changes from one branch into another branch.

This is a scenario of a new **develop** branch from **main/master**. A line of text is added into the **develop** file, changes are committed and then merged into the **main/master** branch.


1) `git branch development-branch-name`- Create a new branch and name it *development-branch-name*.
2) `git checkout development-branch-name` - Exit the **main** branch and enter the **develop** branch. Make your changes to the file.
3) `git commit -m "commit changes"`
4) `git push --set-upstream origin development-branch-name`- Once pushed, on github select **Compare & pull request**, add a title, description and anything else required in your project, such as labels or reviewers.
6) Select **pull request**, wait for a confirmation, then **merge pull request**.
7) `git checkout` - Returns to the main branch.
8) `git pull` - update recent changes for the repository.

### **Merge Conflicts**

Merge conflicts in Git occur when two branches with changes to the same part of a file are merged. When a merge conflict occurs, Git will mark the file as conflicted, and you will need to address the changes before completing the merge. You can solve merge conflicts in a number of ways such as:
- Navigating to the `Pull` Request **via the GitHub Web Interface** and resolving the conflict.
- Solving **Merge Conflicts** During Rebase by using `git rebase branch-name`, editing the conflicted files and running `git add <file-name>` for each resolved file. `git rebase --abort` is used to abort the changes.
- **Force Pushing** After Conflict Resolution. The conflicts can be resolved locally, by editing the files and comitting the resolution and entering `git push origin branch-name --force`
- **Squashing** Commits to Avoid Merge Conflicts.  You can start an interactive rebase by using `git rebase -i HEAD~<number-of-commits>`, you can mark commits for squashing by applying `squash` or `s` and then resolve them as you would in a normal rebase. After resolving the changes enter `git push origin branch-name --force`.

#### Deleting the last 16 commits and pushing the local changes to remote repo.
1. git add .
2. git commit -m "saving changes before rebase
3. git rebase -i HEAD~16
4. git rebase --continue
5. git config pull.rebase true
6. git push origin main --force