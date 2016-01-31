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

# Installing Docker
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker
apt-get -y install docker-engine

# Add Vagrant user in docker group
usermod -a -G docker vagrant

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

#Redis-server with init script
wget -O /etc/init.d/redis-server https://gist.github.com/lsbardel/257298/raw/d48b84d89289df39eaddc53f1e9a918f776b3074/redis-server-for-init.d-startup
chmod 755 /etc/init.d/redis-server
update-rc.d redis-server defaults
chown redis /var/log/redis/redis-server.log

# PHP-fpm auto-start
update-rc.d php5-fpm defaults
