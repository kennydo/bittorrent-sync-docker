BitTorrent Sync Docker
======================

The ``btsync`` Docker image runs BitTorrent Sync. It loads configuration from ``/btsync/btsync.conf``.
By default, the provided ``Makefile`` mounts ``/var/btsync`` on the host machine as ``/btsync``.

Configuration
=============

When configuring Sync, keep in mind that the configuration is in the perspective of the guest machine,
so directories will be under ``/btsync``, not ``/var/btsync`` (if you use the volume mounting arguments from the ``Makefile``).

Also, be sure to configure the ``listening_port`` to be the same as what is ``EXPOSE``'d in the Dockerfile, which is port 7422.
