# How to release
## manual release with gitflow
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
* TODO