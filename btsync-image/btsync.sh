#!/bin/sh
exec /sbin/setuser btsync /opt/bittorrent/btsync --nodaemon --log /var/log/btsync.log --config /btsync/btsync.conf

