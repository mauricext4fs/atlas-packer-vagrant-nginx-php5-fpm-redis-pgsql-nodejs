# Specific installation script for that host
do-release-upgrade
apt-get update
apt-get install -y nginx
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
apt-get install -y python-software-properties
add-apt-repository ppa:ondrej/php5-5.6
add-apt-repository ppa:chris-lea/node.js
add-apt-repository ppa:rwky/redis
add-apt-repository ppa:nginx/stable
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
