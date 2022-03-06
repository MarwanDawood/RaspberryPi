## Raspberry Pi Projects
This repository contains projects deployed over RPi.

### Quick guide for [Markdown](https://confluence.atlassian.com/bitbucketserver/markdown-syntax-guide-776639995.html).

### Quick guide for Git
1. Getting lost commits
```
git reflog
git checkout HEAD@{...}
```
2. Adding tag
```
git tag <tag-name> <first 5 digits of commit> -m "message"
git push origin --tags
```
3. Deleting tag
```
git tag -d <tag-name>
git push origin --tags
```
4. keeping the local modifications somehow,
```
git stash
git pull origin master
```
5. deleting a branch
```
git branch -d <branch_name>
git push origin --delete <branch_name>
```
