#!/bin/bash
DNSMASQ_CHINA_LIST_URL="https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf"
CHINA_IP_LIST_URL="https://github.com/17mon/china_ip_list/raw/master/china_ip_list.txt"
HOSTS_URL="https://github.com/StevenBlack/hosts/raw/master/hosts"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_DIR="$DIR/tmp"
OUT_DIR="$DIR/output"

mkdir -p $OUT_DIR
cd $DIR
bash pre.sh
wget -O - $DNSMASQ_CHINA_LIST_URL | egrep -v '^#' | sed -e 's|^server=/\(.*\)/114.114.114.114$|domain:\1|' | python3 v2geo.py geosite $OUT_DIR/geosite.dat -i - CN
wget -O - $CHINA_IP_LIST_URL | python3 v2geo.py geoip $OUT_DIR/geoip.dat -i - CN
wget -O - $HOSTS_URL | egrep "^0.0.0.0 " | awk '{print "domain:"$2}' | python3 v2geo.py geosite $OUT_DIR/adsite.dat -i - AD
