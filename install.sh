#!/bin/bash

apt install -qq -y iptables-persistent ipset

wget https://raw.githubusercontent.com/freeyoung/netfilter-persistent-plugin-ipset/master/10-ipset

chmod +x 10-ipset
mv 10-ipset /usr/share/netfilter-persistent/plugins.d/
