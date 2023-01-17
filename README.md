# Docker image (kali) with Wi-Fi tools

## Building

`sudo docker build kali/ -t kali`

To build the version with OpenSSH server:

`sudo docker build kali/ -f kali/Dockerfile.sshd -t kali-sshd`

## Pulling

### DockerHub

[![Build status](https://github.com/FinchSec/kali/actions/workflows/docker.yml/badge.svg)](https://github.com/FinchSec/kali/actions/workflows/docker.yml)

URL: https://hub.docker.com/r/finchsec/kali

`sudo docker pull finchsec/kali`

### GitHub

[![Build status](https://github.com/FinchSec/kali/actions/workflows/docker-ghcrio.yml/badge.svg)](https://github.com/FinchSec/kali/actions/workflows/docker-ghcrio.yml)

`sudo docker pull ghcr.io/finchsec/kali`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host kali`

To automatically pull from DockerHub, replace `kali` with `finchsec/kali`. For GitHub, replace it with `ghcr.io/finchsec/kali`