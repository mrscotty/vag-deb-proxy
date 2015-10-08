#!/bin/bash
#
# Provision Squid Debian Proxy

set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y squid-deb-proxy

/etc/init.d/squid-deb-proxy stop
(cd / && patch -p1 < /vagrant/squid-deb-proxy.patch)
chown -R vagrant.vagrant /var/log/squid-deb-proxy
/etc/init.d/squid-deb-proxy start
