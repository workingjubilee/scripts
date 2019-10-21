#!/bin/sh
# Requires root to edit /etc/hosts

display_help() {
  cat << EOM
  USAGE:
  hostban.sh ban [SITE] to add a site to hostbans
  hostban.sh unban [SITE] to remove a site from hostbans
  Banning/unbanning sites other than twitter is not currently implemented ^_^;;
EOM
}

ban_url() {
  # Applies the loopback address to the URL
  echo "127.0.0.1 $1" 1>> /etc/hosts
}

if [ $(id -u) -ne 0 ]; then
  display_help
  echo "\n  This script requires root privileges, please run this with sudo ./hostban.sh"
  exit 1
fi

case $1 in 
  ban)
    ban_url "api.twitter.com"
    ban_url "mobile.twitter.com"
    ban_url "www.twitter.com"
    ;;
  unban)
    # \x2E specifies the "dot" character in hexadecimal
    sed -i '/twitter\x2Ecom/d' /etc/hosts
    ;;
  *)
    display_help\
    exit 1
esac

# nmcli connection reload