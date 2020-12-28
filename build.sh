JAMULUS_VERSION=3.6.2
JAMULUS_BUILD_VERSION=3_6_2
sudo docker build --build-arg JAMULUS_BUILD_VERSION=${JAMULUS_BUILD_VERSION} --tag "guidowojke/jamulus:${JAMULUS_VERSION}-alpine" .

