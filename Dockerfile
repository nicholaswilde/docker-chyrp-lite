FROM ubuntu:20.04 as dl
ARG VERSION
ARG CHECKSUM
ARG FILENAME="${VERSION}.tar.gz"
WORKDIR /tmp
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    wget=1.20.3-1ubuntu1 \
    ca-certificates=20210119~20.04.1 && \
  echo "**** download app ****" && \
  mkdir /app && \
  wget -q --no-check-certificate "https://github.com/xenocrat/chyrp-lite/archive/${FILENAME}" && \
  echo "${CHECKSUM}  ${FILENAME}" | sha256sum -c && \
  tar -xvf "${FILENAME}" --strip-components 1 -C /app
WORKDIR /app
RUN \
  echo "**** cleanup ****" && \
  rm -rf \
    Dockerfile \
    docker-compose.* \
    ./*.md \
    .gitignore

FROM php:7.4-apache
ARG BUILD_DATE
ARG VERSION
# hadolint ignore=DL3048
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="nicholaswilde"
RUN \
  echo "**** install packages ****" && \
  set -eux && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    libsqlite3-dev=3.27.2-3+deb10u1 \
    libxml2-dev=2.9.4+dfsg1-7+deb10u1 && \
  echo "**** install extensions ****" && \
  docker-php-ext-install \
    session \
    json \
    ctype \
    xml \
    simplexml \
    pdo_mysql \
    pdo_sqlite && \
  mkdir /data && \
  chown -R www-data:www-data /data && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/ \
    /var/tmp/*
COPY --from=dl --chown=33:33 /app /var/www/html
VOLUME \
  /data \
  /var/www/html
