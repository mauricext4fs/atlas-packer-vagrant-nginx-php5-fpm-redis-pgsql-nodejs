# Specific installation script for that host
apt-get update
#setenforce 0
apt-get install -y nginx
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
apt-get install -y python-software-properties
apt-get install -y software-properties-common
apt-get update && apt-get upgrade
apt-get install -y software-properties-common
add-apt-repository -y ppa:ondrej/php5-5.6
add-apt-repository -y ppa:chris-lea/node.js
add-apt-repository -y ppa:rwky/redis
add-apt-repository -y ppa:nginx/stable
apt-get update && apt-get upgrade
apt-get install -y g++
apt-get install -y redis-server
apt-get install -y php5-fpm
apt-get install -y php5-curl
apt-get install -y php5-pgsql
apt-get install -y php-pear
apt-get install -y php5-imagick
apt-get install -y php5-json
apt-get install -y ruby ruby-dev
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y tcl
apt-get install -y git

#setenforce 0
#curl --silent --location https://deb.nodesource.com/setup_0.12
#apt-get install --yes nodejs
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
npm install -g nodemon
#setenforce 0
# install compass
gem install foundation
gem install compass
gem install sass
