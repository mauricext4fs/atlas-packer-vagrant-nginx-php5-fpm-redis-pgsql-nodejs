#!/bin/bash

perl -p -i -e 's#http://us.archive.ubuntu.com/ubuntu#http://mirror.rackspace.com/ubuntu#gi' /etc/apt/sources.list

# Update the box
apt-get -y update >/dev/null
apt-get -y install facter linux-headers-$(uname -r) build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev curl unzip >/dev/null

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config


# Specific installation script for that host
apt-get update
apt-get install -y nginx
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
apt-get install -y python-software-properties
add-apt-repository ppa:ondrej/php5-5.6
add-apt-repository ppa:chris-lea/node.js
/vagrant/bin/apt.postgresql.org.sh
apt-get update && apt-get upgrade
apt-get install -y g++
apt-get install -y redis-server
apt-get install -y php5-fpm
apt-get install -y php5-curl
apt-get install -y php5-pgsql
apt-get install -y php-pear
apt-get install -y php5-imagick
apt-get install -y php5-json
apt-get install -y postgresql-9.4
apt-get install -y nodejs
apt-get install -y tcl
apt-get install -y git

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

npm install -g nodemon

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub


