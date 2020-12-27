# How to release
## GitFlow Documentation
* https://nvie.com/posts/a-successful-git-branching-model/
* https://jeffkreeftmeijer.com/git-flow/
* https://bitbucket.org/atlassian/jgit-flow/wiki/Home

### manual release with gitflow
```
RELEASE_VERSION=3.6.0.1

git checkout develop
git pull
git checkout -b release/${RELEASE_VERSION}
git push --set-upstream origin release/${RELEASE_VERSION}
# changes needed to prepare the release
git checkout master
git merge --no-ff release/${RELEASE_VERSION}
git tag v${RELEASE_VERSION}
git push
git push --tags
git checkout develop
git merge --no-ff release/${RELEASE_VERSION}
git push
git push origin --delete release/${RELEASE_VERSION}
git branch -d release/${RELEASE_VERSION}
```
## automated release with jgitflow-maven-plugin
* Quick Release
```
mvn jgitflow:release-start jgitflow:release-finish
git push --all
```