JAMULUS_VERSION=3.6.0
JAMULUS_BUILD_VERSION=3_6_0
sudo docker build --build-arg JAMULUS_BUILD_VERSION=${JAMULUS_BUILD_VERSION} --tag "guidowojke/jamulus:${JAMULUS_VERSION}-alpine" .

