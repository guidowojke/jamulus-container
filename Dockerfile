FROM alpine:3.13.1 as builder

ARG JAMULUS_BUILD_VERSION=3_6_2

ENV JAMULUS_VERSION ${JAMULUS_BUILD_VERSION}

RUN \
 echo "**** updating system packages (${JAMULUS_VERSION})****" && \
 apk update

RUN \
 echo "**** install build packages ****" && \
   apk add --no-cache --virtual .build-dependencies \
        build-base \
        wget \
        qt5-qtbase-dev \
        qt5-qttools-dev \
        qtchooser

WORKDIR /tmp
RUN \
 echo "**** getting source code (${JAMULUS_VERSON})****" && \
   wget --no-verbose "https://github.com/jamulussoftware/jamulus/archive/r${JAMULUS_VERSION}.tar.gz" && \
   tar xzf r${JAMULUS_VERSION}.tar.gz

# Github directory format for tar.gz export
WORKDIR /tmp/jamulus-r${JAMULUS_VERSION}
RUN \
 echo "**** compiling source code (${JAMULUS_VERSION}) ****" && \
   qmake "CONFIG+=nosound headless" Jamulus.pro && \
   make clean && \
   make && \
   cp Jamulus /usr/local/bin/ && \
   rm -rf /tmp/* && \
   apk del .build-dependencies

FROM alpine:3.13.1

RUN apk add --update --no-cache \
    qt5-qtbase-x11 icu-libs tzdata

COPY --from=builder /usr/local/bin/Jamulus /usr/local/bin/Jamulus
ENTRYPOINT ["Jamulus"]
