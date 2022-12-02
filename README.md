# Docker image (kali) with Wi-Fi tools

## Building

`sudo docker build kali/ -t kali`

## Pulling

### DockerHub

URL: https://hub.docker.com/r/finchsec/kali

`sudo docker pull finchsec/kali`

### GitHub

`sudo docker pull ghcr.io/finchsec/kali`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host kali`

To automatically pull from DockerHub, replace `kali` with `finchsec/kali`. For GitHub, replace it with `ghcr.io/finchsec/kali`