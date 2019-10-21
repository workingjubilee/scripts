#!/bin/sh

display_help() {
  cat << EOM
  USAGE:
  --ban (site) to add a site to hostbans
  --unban (site) to remove a site from hostbans
EOM
}

ban_url() {
  echo "127.0.0.1 $1" 1>> /etc/hosts
}

if [ $(id -u) -ne 0 ]; then
  display_help
  echo "\n  This script requires root privileges, please run this with sudo ./hostban.sh"
  exit 1
fi

case $1 in 
  --ban)
    ban_url "api.twitter.com"
    ban_url "mobile.twitter.com"
    ban_url "www.twitter.com"
    ;;
  --unban)
    # \x2E specifies the "dot" character in hexadecimal
    sed -i '/twitter\x2Ecom/d' /etc/hosts
    ;;
  *)
    display_help\
    exit 1
esac

# nmcli connection reload