#!/bin/bash

# exit script if return code != 0
set -e

# build scripts
####

# download build scripts from github
curl --connect-timeout 5 --max-time 600 --retry 5 --retry-delay 0 --retry-max-time 60 -o /tmp/arch-arm-scripts-master.zip -L https://github.com/Joery/arch-arm-scripts/archive/master.zip

# unzip build scripts
unzip /tmp/arch-arm-scripts-master.zip -d /tmp

# move shell scripts to /root
mv /tmp/arch-arm-scripts-master/shell/arch/docker/*.sh /usr/local/bin/

# pacman packages
####

# define pacman packages
pacman_packages="kmod openvpn privoxy bind-tools gnu-netcat ipcalc"

# install pre-reqs
pacman -S --needed $pacman_packages --noconfirm

# cleanup
cleanup.sh
