FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential git-core git wget && \
    apt-get -y install subversion libncurses5-dev zlib1g-dev gawk flex quilt xsltproc && \
    apt-get -y install unzip python vim

RUN mkdir /openwrt && \
    cd /openwrt && \
    git clone http://git.openwrt.org/10.03/openwrt.git && \
    git clone http://git.openwrt.org/10.03/packages.git && \
    mv openwrt backfire && \
    cd backfire && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a && \
    mv feeds.conf.default feeds.conf && \
    cd /openwrt && \
    mv packages/* backfire/package/

RUN cd /openwrt/backfire/package/net && \
    git clone https://github.com/h3dema/openvswitch.git
    
# make default configuration
RUN useradd --home /home/openwrt openwrt && \
    chown -R openwrt /openwrt


COPY config /openwrt/backfire/.config

COPY bashrc /home/openwrt/.bashrc
RUN chown -R openwrt /home/openwrt && \
    chmod 755 /home/openwrt/.bashrc
