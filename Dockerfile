FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential git-core git wget && \
    apt-get -y install subversion libncurses5-dev zlib1g-dev gawk flex quilt xsltproc

RUN mkdir /openwrt && \
    cd /openwrt && \
    git clone http://git.openwrt.org/10.03/openwrt.git && \
    git clone git clone http://git.openwrt.org/10.03/packages.git && \
    mv openwrt backfire && \
    cd backfire && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a
    
 
