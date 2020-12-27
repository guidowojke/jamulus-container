# How to release
## create a release branch from develop
RELEASE_VERSION=3.6.0.0

git checkout develop
git pull
git checkout -b release/${RELEASE_VERSION}
git push
# changed needed to prepare the release
git checkout master
git merge --no-ff release/${RELEASE_VERSION}
git tag v${RELEASE_VERSION}
git push
git checkout develop
git merge --no-ff release/${RELEASE_VERSION}
git push
