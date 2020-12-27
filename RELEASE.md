# How to release
## create a release branch from develop
git checkout develop
git pull
git checkout -b release/$RELEASE_VERSION
git push
