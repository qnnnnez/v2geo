#!/bin/bash
DNSMASQ_CHINA_LIST_URL="https://rawgit.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf"
CHINA_IP_LIST_URL="https://rawgit.com/17mon/china_ip_list/master/china_ip_list.txt"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_DIR="$DIR/tmp"
OUT_DIR="$DIR/output"

mkdir -p $OUT_DIR
cd $DIR
bash pre.sh
wget -O - $DNSMASQ_CHINA_LIST_URL | sed -e 's|^server=/\(.*\)/114.114.114.114$$|domain:\1|' |  egrep -v '^#' | python3 v2geo.py geosite $OUT_DIR/geosite.dat -i - CN
wget -O - $CHINA_IP_LIST_URL | python3 v2geo.py geoip $OUT_DIR/geoip.dat -i - CN
