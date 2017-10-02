# Openwrt-Devel


# Installation

## Docker installation

The installation of Docker is easy in Ubuntu 14.04 or latter. Just issue the command:
```bash
sudo apt-get install -y docker.io
```

## Devel container

The following commands (1) download, install and configure the container with all tools and codes, and (2) starts the container, changing to the working directory (/home/ethanol).

```bash
docker build -t openwrt github.com/h3dema/openwrt-devel.git
docker run -w /openwrt -it openwrt
```
