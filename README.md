# Raspberry Pi Projects

cheat sheet for [Markdown](https://confluence.atlassian.com/bitbucketserver/markdown-syntax-guide-776639995.html)

## Git cheat sheet
>getting lost commits
```
git reflog
git checkout HEAD@{...}
```

>changing commit before pushing
```
git commit --amend
```

>removing file after add and before commit
```
git reset <file>
```
OR
```
git reset HEAD file.txt
```

>adding tag
```
git tag <tag-name> <first 5 digits of commit> -m "message"
git push origin --tags
```

>deleting tag
```
git tag -d <tag-name>
git push origin --tags
```

>keeping the local modifications somehow,
```
git stash 
git pull origin master
```

>creating new branch
```
git branch <branch name>
git checkout <branch name>
git push --all -u #to push all branches
```

>deleting a branch
```
git branch -d <branch_name>
git push origin --delete <branch_name>
```

>retrieving some deleted files before commiting
```
git checkout HEAD <file>
```

>cloning new project
```
git clone git@gitlab.com:Agrisource_Data/001_Ingenu_rACM.git
```

>deleting all unstaged files
```
git reset --soft
```

>deleting a commit
```
git revert <commit hash>
```
