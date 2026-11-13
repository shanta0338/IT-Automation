# Git & GitHub Command Reference

A practical reference for everyday Git usage, GitHub collaboration, and
open-source contributions.

> Replace placeholders such as `<url>`, `<branch>`, and `<filename>`
> with your actual values. Run commands from the relevant repository
> directory unless stated otherwise.

## 1. Essential Git concepts

-   **Working tree:** the files currently in your project directory.
-   **Staging area (index):** changes selected for the next commit.
-   **Commit:** a saved snapshot in the repository's history.
-   **Branch:** an independent line of development.
-   **Remote:** another copy of the repository, commonly hosted on
    GitHub.
-   **`origin`:** the conventional name for the remote you cloned from
    or added.

Typical flow:

``` bash
# Edit files
git status
git diff
git add <filename>
git commit -m "Describe the change"
git push
```

## 2. Install and configure Git

Check the installed version:

``` bash
git --version
```

Set your author identity (usually once per computer):

``` bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

View configuration:

``` bash
git config --list
git config --global --list
```

Set the default initial branch for newly created repositories:

``` bash
git config --global init.defaultBranch main
```

## 3. Clone an existing repository

Clone a GitHub repository:

``` bash
git clone <url>
cd <repository-folder>
```

Clone into a custom folder:

``` bash
git clone <url> <folder-name>
```

Clone a specific branch:

``` bash
git clone --branch <branch> <url>
```

List configured remotes and their URLs:

``` bash
git remote -v
```

## 4. Start a new local repository and connect GitHub

Use this when you have a local project that is not yet a Git repository:

``` bash
cd <project-folder>
git init
git branch -M main
git add .
git commit -m "Initial commit"
git remote add origin <url>
git push -u origin main
```

If the remote already exists, inspect it first:

``` bash
git remote -v
```

Change the existing `origin` URL:

``` bash
git remote set-url origin <url>
```

Add a remote only if one does not already exist:

``` bash
git remote add origin <url>
```

If GitHub's repository already contains a README, licence, or other
commits, the remote history may differ from your local history. Fetch
and inspect before deciding whether to merge or rebase. Do not
force-push merely to bypass the warning.

## 5. Check repository and branch status

Show the working-tree state:

``` bash
git status
git status --short
```

Show the current branch:

``` bash
git branch --show-current
```

List local branches:

``` bash
git branch
```

List local and remote-tracking branches:

``` bash
git branch -a
```

Show the latest commit:

``` bash
git log -1 --oneline
```

Show a compact commit history:

``` bash
git log --oneline
git log --oneline --graph --decorate --all
```

## 6. Stage and unstage changes

Stage one file:

``` bash
git add <filename>
```

Stage several files:

``` bash
git add <file1> <file2>
```

Stage all changes under the current directory:

``` bash
git add .
```

Stage all tracked modifications and deletions, but not untracked files:

``` bash
git add -u
```

Interactively select parts of changes:

``` bash
git add -p
```

Unstage a file without deleting its working-tree changes:

``` bash
git restore --staged <filename>
```

Unstage everything:

``` bash
git restore --staged .
```

## 7. Inspect changes before committing

Show unstaged changes:

``` bash
git diff
```

Show a summary of unstaged changes:

``` bash
git diff --stat
```

Check for whitespace errors in unstaged changes:

``` bash
git diff --check
```

Show staged changes:

``` bash
git diff --cached
```

Show a summary of staged changes:

``` bash
git diff --cached --stat
```

Show all tracked changes compared with the latest commit:

``` bash
git diff HEAD
```

Inspect one file:

``` bash
git diff -- <filename>
```

## 8. Commit changes

Create a commit:

``` bash
git commit -m "Add descriptive commit message"
```

Stage tracked modifications and commit them in one step:

``` bash
git commit -am "Describe the change"
```

Note: `git commit -am` does not include new, untracked files.

Edit the most recent commit:

``` bash
git commit --amend
```

Change the latest commit message:

``` bash
git commit --amend -m "Updated commit message"
```

Amending changes commit history. Avoid amending commits already shared
with others unless you understand the consequences and coordinate with
collaborators.

## 9. Push and pull

Push the current branch and set its upstream on the first push:

``` bash
git push -u origin HEAD
```

Push the current branch after upstream tracking is configured:

``` bash
git push
```

Push a named branch:

``` bash
git push origin <branch>
```

Fetch remote updates without integrating them:

``` bash
git fetch origin
```

Fetch and integrate the upstream branch using the configured pull
strategy:

``` bash
git pull
```

Pull a specific remote branch:

``` bash
git pull origin main
```

Prefer inspecting remote changes before integration:

``` bash
git fetch origin
git log --oneline HEAD..origin/main
git diff HEAD..origin/main
```

## 10. Branch management

Create a branch:

``` bash
git branch <branch-name>
```

Create and switch to a branch:

``` bash
git switch -c <branch-name>
```

Switch branches:

``` bash
git switch <branch-name>
```

Rename the current branch:

``` bash
git branch -m <new-name>
```

Rename `master` to `main`:

``` bash
git branch -m master main
```

Delete a merged local branch:

``` bash
git branch -d <branch-name>
```

Force-delete a local branch (may discard unmerged work):

``` bash
git branch -D <branch-name>
```

Delete a remote branch:

``` bash
git push origin --delete <branch-name>
```

Publish a new branch:

``` bash
git push -u origin <branch-name>
```

## 11. Merge and rebase

Merge another branch into the current branch:

``` bash
git merge <branch-name>
```

Rebase the current branch onto the latest remote `main`:

``` bash
git fetch origin
git rebase origin/main
```

Continue a rebase after resolving conflicts:

``` bash
git add <resolved-file>
git rebase --continue
```

Abort a rebase:

``` bash
git rebase --abort
```

Abort a merge in progress:

``` bash
git merge --abort
```

After resolving merge conflicts, stage the resolved files and complete
the merge as instructed by Git.

## 12. Undo and recover changes

Discard unstaged changes in one file (destructive):

``` bash
git restore <filename>
```

Discard all unstaged tracked changes (destructive):

``` bash
git restore .
```

Restore a file from the latest commit:

``` bash
git restore --source=HEAD -- <filename>
```

Create a new commit that reverses an earlier commit:

``` bash
git revert <commit-hash>
```

Move the current branch back one commit but keep changes staged:

``` bash
git reset --soft HEAD~1
```

Move the current branch back one commit and keep changes unstaged:

``` bash
git reset HEAD~1
```

Discard the last commit and its changes (high risk):

``` bash
git reset --hard HEAD~1
```

`git reset --hard` can permanently discard uncommitted work. Prefer
`git revert` for undoing commits already pushed to a shared branch.

Find previous commit references:

``` bash
git reflog
```

## 13. Stash temporary work

Save tracked and untracked changes temporarily:

``` bash
git stash push -u -m "Work in progress"
```

List stashes:

``` bash
git stash list
```

Reapply the latest stash and keep it in the stash list:

``` bash
git stash apply
```

Apply and remove the latest stash:

``` bash
git stash pop
```

Delete the latest stash:

``` bash
git stash drop
```

## 14. Remove files and folders

Remove a tracked file from Git and the working tree:

``` bash
git rm <filename>
```

Remove a tracked directory recursively:

``` bash
git rm -r <directory>
```

Remove all tracked files under the current directory:

``` bash
git rm -r .
```

Force removal when a tracked file has local modifications:

``` bash
git rm -f <filename>
```

Commit a deletion:

``` bash
git commit -m "Remove obsolete files"
```

Push the deletion commit:

``` bash
git push origin main
```

**Important:** `git rm -rf .` is destructive. It removes tracked files
from the working tree and stages their deletion. It does not erase
commit history and does not necessarily remove untracked files. A
subsequent commit and push to `main` publishes the deletions to that
branch. Check `pwd`, `git status`, and `git diff --cached` before
committing.

If you only want Git to stop tracking a file while keeping the local
copy:

``` bash
git rm --cached <filename>
```

For a directory:

``` bash
git rm -r --cached <directory>
```

## 15. Force push --- use with caution

Normal push:

``` bash
git push origin <branch>
```

Safer force push after rewriting your own branch:

``` bash
git push --force-with-lease origin <branch>
```

Force push:

``` bash
git push --force origin main
```

Short form:

``` bash
git push -f origin main
```

Set upstream while force-pushing:

``` bash
git push -u origin main --force-with-lease
```

**Warning:** Force pushing rewrites the remote branch reference and can
overwrite commits published by other contributors. Prefer
`--force-with-lease` over `--force`, and use it only when you understand
the branch history and have permission. Do not force-push to a shared or
protected `main` branch.

## 16. Compare local and remote branches

Fetch first:

``` bash
git fetch origin
```

Show commits on local `main` but not remote `main`:

``` bash
git log --oneline origin/main..main
```

Show commits on remote `main` but not local `main`:

``` bash
git log --oneline main..origin/main
```

Compare file changes:

``` bash
git diff main origin/main
```

Show tracking and ahead/behind information:

``` bash
git status -sb
```

## 17. Tags

List tags:

``` bash
git tag
```

Create a tag:

``` bash
git tag v1.0.0
```

Create an annotated tag:

``` bash
git tag -a v1.0.0 -m "Release v1.0.0"
```

Push one tag:

``` bash
git push origin v1.0.0
```

Push all tags:

``` bash
git push origin --tags
```

Delete a local tag:

``` bash
git tag -d v1.0.0
```

Delete a remote tag:

``` bash
git push origin --delete v1.0.0
```

## 18. Useful .gitignore commands and patterns

Create or edit `.gitignore`:

``` bash
nano .gitignore
```

Example Python `.gitignore`:

``` gitignore
.venv/
__pycache__/
*.py[cod]
.pytest_cache/
.ruff_cache/
.mypy_cache/
.env
.env.*
!.env.example
.ipynb_checkpoints/
dist/
build/
```

Check whether a pattern ignores a file:

``` bash
git check-ignore -v <filename>
```

Adding a file to `.gitignore` does not untrack it if it was already
committed. To stop tracking it while retaining the local file:

``` bash
git rm --cached <filename>
git commit -m "Stop tracking generated file"
```

Never commit passwords, API keys, tokens, private keys, or other
secrets. If a secret was committed, revoke or rotate it; deleting the
file in a later commit does not remove it from history.

## 19. Pre-PR Git checklist

Run these checks before opening or updating a Pull Request.

### 1. Check the current branch

``` bash
git branch --show-current
```

Confirm that you are on your feature or bug-fix branch, not accidentally
on `main`.

### 2. Check the working directory

``` bash
git status
```

Identify modified, staged, and untracked files.

### 3. Fetch remote updates

``` bash
git fetch origin
```

This updates remote-tracking references without merging them into your
branch.

### 4. Inspect your changes

``` bash
git diff --stat
git diff
```

Review the size and exact content of unstaged changes.

### 5. Check whitespace

``` bash
git diff --check
```

For staged changes, also run:

``` bash
git diff --cached --check
```

### 6. Run automated checks

``` bash
pre-commit run --all-files
```

Review any files automatically modified by hooks, then run the checks
again if necessary.

### 7. Run relevant tests

Example:

``` bash
pytest path/file.py -v
```

Run the project's broader test suite when appropriate. Follow the
repository's documented test instructions.

### 8. Review everything again

``` bash
git status
git diff --stat
git diff
```

Also inspect staged changes if you have staged files:

``` bash
git diff --cached
```

### 9. Stage and commit

``` bash
git add <relevant-files>
git diff --cached
git commit -m "message"
```

Use `git add .` only when you have reviewed the complete set of changes
and are certain every included file belongs in the commit.

### 10. Push your branch

``` bash
git push -u origin HEAD
```

For later pushes, `git push` is normally sufficient once upstream
tracking is configured.

### 11. Final verification

``` bash
git status
git log -1 --oneline
git remote -v
```

Confirm the intended commit was created and pushed, and check that the
working tree is clean.

## 20. A compact everyday workflow

``` bash
# Start work
git switch -c fix/my-change

# Inspect
git status
git branch --show-current

# Edit files, then review
git diff --stat
git diff
git diff --check

# Validate
pre-commit run --all-files
pytest -v

# Stage, inspect and commit
git add <relevant-files>
git diff --cached
git commit -m "Describe the change"

# Synchronise and publish
git fetch origin
git push -u origin HEAD

# Verify
git status
```

## 21. Practical rules

1.  Run `git status` before and after significant Git operations.
2.  Review `git diff` before staging and `git diff --cached` before
    committing.
3.  Use descriptive commit messages that explain the change.
4.  Prefer feature branches for open-source contributions.
5.  Fetch before integrating remote changes.
6.  Prefer `git revert` over rewriting shared history.
7.  Prefer `git push --force-with-lease` over `git push --force` when a
    force push is genuinely necessary.
8.  Never use destructive commands without checking the current
    directory, branch, and working-tree state.
9.  Keep secrets, credentials, virtual environments, caches, and
    generated files out of commits.
10. Read each repository's contribution guidelines and run its
    prescribed tests and checks.

------------------------------------------------------------------------

End of reference.
