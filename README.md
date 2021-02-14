# Docker Template
[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/nicholaswilde/template)](https://hub.docker.com/r/nicholaswilde/template)
[![Docker Pulls](https://img.shields.io/docker/pulls/nicholaswilde/template)](https://hub.docker.com/r/nicholaswilde/template)
[![GitHub](https://img.shields.io/github/license/nicholaswilde/docker-template)](./LICENSE)
[![ci](https://github.com/nicholaswilde/docker-template/workflows/ci/badge.svg)](https://github.com/nicholaswilde/docker-template/actions?query=workflow%3Aci)
[![lint](https://github.com/nicholaswilde/docker-template/workflows/lint/badge.svg?branch=main)](https://github.com/nicholaswilde/docker-template/actions?query=workflow%3Alint)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

A template repo for Docker images.

## Dependencies

* None

## Usage
### docker cli

```bash
$ docker run -d \
  --name=template \
  -e TZ=America/Los_Angeles `# optional` \
  -e PUID=1000  `# optional` \
  -e PGID=1000   `# optional` \
  -p 3000:3000 \
  --restart unless-stopped \
  nicholaswilde/template
```

### docker-compose

See [docker-compose.yaml](./docker-compose.yaml).

## Development

See [Wiki](https://github.com/nicholaswilde/docker-template/wiki/Development).

## Troubleshooting

See [Wiki](https://github.com/nicholaswilde/docker-template/wiki/Troubleshooting).

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
