# Docker image (kali) with Wi-Fi tools

## List of tools

- Kismet
- TShark
- Aircrack-ng suite
- tcpdump
- John The ripper
- Cowpatty
- routerkeygenpc
- asleap
- bettercap
- hostapd-mana
- reaver
- mdk3
- mdk4
- hostapd-wpe
- freeradius-wpe
- wig-ng
- wifipumpkin3
- airgeddon
- eaphammer
- eapmd5pass
- pixiewps
- bully
- hashcat (not available on armv7l)
- wifite
- hashcat-utils (not available on armv7l)
- hcxdumptool
- wpa-sycophant
- pcapfix
- termshark
- hcxtools

## Building

### Base

`sudo docker build . -f kali/Dockerfile.base -t kali-sshd`

### Main image

`sudo docker build . -t kali`

### OpenSSH server

`sudo docker build . -f kali/Dockerfile.sshd -t kali-sshd`

## Pulling

[![Build status](https://github.com/FinchSec/kali/actions/workflows/docker.yml/badge.svg)](https://github.com/FinchSec/kali/actions/workflows/docker.yml)

URL: https://hub.docker.com/r/finchsec/kali

`sudo docker pull finchsec/kali`

## Running

`sudo docker run --rm -it --privileged --net=host --pid=host kali`
