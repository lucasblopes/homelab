# Wolf Container: Manual NVIDIA Driver Setup for Kubernetes

This document outlines the manual process required to package NVIDIA drivers from a host machine for use with the ghcr.io/games-on-whales/wolf:stable container in a Kubernetes environment.

This complex procedure is necessary because the wolf container is designed to bypass the standard Kubernetes NVIDIA Device Plugin and instead expects the driver files to be manually mounted into it at /usr/nvidia.

## Prerequisits

- A Linux host (e.g., Ubuntu 22.04) with a working Kubernetes (K3s) installation.
- NVIDIA drivers correctly installed and running on the host machine.
- Docker installed and running on the host machine. 

---

## Step-by-Step Driver Packaging

```sh
sudo mkdir -p /opt/nvidia-drivers
docker image rm gow/nvidia-driver:latest
docker volume rm nvidia-driver-vol
sudo rm -rf /opt/nvidia-drivers/*
curl https://raw.githubusercontent.com/games-on-whales/gow/master/images/nvidia-driver/Dockerfile | docker build -t gow/nvidia-driver:latest -f - --build-arg NV_VERSION=$(cat /sys/module/nvidia/version) .
docker create --rm --mount source=nvidia-driver-vol,destination=/usr/nvidia gow/nvidia-driver:latest sh
docker run --rm -v nvidia-driver-vol:/volume -it -v /opt/nvidia-drivers:/mnt busybox sh
```

This will open a shell inside the container. Run the copy command:

``` sh
cp -R /volume/* /mnt
exit
```

## Verify the Driver Installation

```sh
/opt/nvidia-drivers/bin/nvidia-smi
```


