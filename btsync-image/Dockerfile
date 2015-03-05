FROM phusion/baseimage:0.9.15
MAINTAINER Kenny Do <kedo@ocf.berkeley.edu>
EXPOSE 7422

# Disable the SSH server installed by phusion by default
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update && \
    apt-get upgrade -y

RUN useradd --uid 1000 -m btsync

# Download and install btsync
RUN mkdir -p /opt/bittorrent && \
    cd /opt/bittorrent && \
    curl -o btsync.tar.gz https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz && \
    tar -xzvf btsync.tar.gz && \
    rm btsync.tar.gz && \
    chmod a+x btsync && \
    chown -R btsync:btsync /opt/bittorrent

# Create the runit service for btsync
RUN mkdir /etc/service/btsync
ADD btsync.sh /etc/service/btsync/run

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

