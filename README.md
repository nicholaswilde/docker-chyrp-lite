# Docker Chyrp Lite
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/nicholaswilde/chyrp-lite)](https://hub.docker.com/r/nicholaswilde/chyrp-lite)
[![Docker Pulls](https://img.shields.io/docker/pulls/nicholaswilde/chyrp-lite)](https://hub.docker.com/r/nicholaswilde/chyrp-lite)
[![GitHub](https://img.shields.io/github/license/nicholaswilde/docker-chyrp-lite)](./LICENSE)
[![ci](https://github.com/nicholaswilde/docker-chyrp-lite/workflows/ci/badge.svg)](https://github.com/nicholaswilde/docker-chyrp-lite/actions?query=workflow%3Aci)
[![lint](https://github.com/nicholaswilde/docker-chyrp-lite/workflows/lint/badge.svg?branch=main)](https://github.com/nicholaswilde/docker-chyrp-lite/actions?query=workflow%3Alint)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

A multi-architecture image for [Chyrp Lite](https://github.com/xenocrat/chyrp-lite).

## Dependencies

* mysql (optional)

## Usage
### docker cli

```bash
$ docker run -d \
  --name=chyrp-lite \
  -e TZ=America/Los_Angeles `# optional` \
  -p 80:80 \
  --restart unless-stopped \
  nicholaswilde/chyrp-lite
```

### docker-compose

See [docker-compose.yaml](./docker-compose.yaml).

### Install

Go to the following address to finish the installation process

```shell
http://<ip-address>/install.php
```

## Development

See [Wiki](https://github.com/nicholaswilde/docker-chyrp-lite/wiki/Development).

## Troubleshooting

See [Wiki](https://github.com/nicholaswilde/docker-chyrp-lite/wiki/Troubleshooting).

## Pre-commit hook

If you want to automatically generate `README.md` files with a pre-commit hook, make sure you
[install the pre-commit binary](https://pre-commit.com/#install), and add a [.pre-commit-config.yaml file](./.pre-commit-config.yaml)
to your project. Then run:

```bash
pre-commit install
pre-commit install-hooks
```
Currently, this only works on `amd64` systems.

## License

[Apache 2.0 License](./LICENSE)

## Author
This project was started in 2021 by [Nicholas Wilde](https://github.com/nicholaswilde/).
