# Openwrt-Devel

This repository helps create a docker container to compile and develop openwrt applications.
It downloads OpenWRT Backfire 10.03 (compatible with our Linksys devices).
If you want other version, you can edit the Dockerfile.
This repository automatically downloads openvswitch implementation to the packages directory, so you can compile create an image with openvswitch.

## Installation

### Docker installation

The installation of Docker is easy in Ubuntu 14.04 or latter. Just issue the command:
```bash
sudo apt-get install -y docker.io
```

## Devel container

The following commands (1) download, install and configure the container with all tools and codes, and (2) starts the container, changing to the working directory (/home/ethanol).

```bash
docker build -t openwrt github.com/h3dema/openwrt-devel.git
docker run -w /openwrt/backfire -u openwrt -it openwrt
```

### Compiling the OpenWRT Backfire

#### To select packages

Use *menuconfig* to select the appropriate platform. The default is brcm_2_4 (for our linksys devices).
You can also use the menu to select which package will be compiled and available to install (using opkg).
By default, some network tools like iw, netcat, iperf, tcpdump and openvswitch are already selected as modules that make will compile.

```bash
make menuconfig
```

#### To compile

```bash
make -j4
```
This **takes time**...
The compiled firmware and packages are placed in */openwrt/backfire/bin/brcm-2.4/*


# Want more ? ##

See in OpenWRT site [how to build openwrt and use make menuconfig](https://wiki.openwrt.org/doc/howto/build).
If you want to know how this repository was made, [go to openwrt build](https://wiki.openwrt.org/doc/howto/buildroot.exigence) to see. Also read [about toolchain](https://wiki.openwrt.org/about/toolchain).
