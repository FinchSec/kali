# Kali Docker with Wi-Fi tools

## Building

`sudo docker build . -t kali`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host kali`

or, coming from DockerHub:

`sudo docker run --rm -it --privileged --net=host --pid=host finchsec/kali`