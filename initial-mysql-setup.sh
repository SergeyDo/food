#!/bin/bash -x

sudo apt-get -y update
sudo apt-get -y upgrade 

# Set the Server Timezone to CST
echo "America/New_York" > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

# Install essential packages
sudo apt-get -y install zsh htop

sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server-5.7 mysql-server/root_password_again password toor'
sudo apt-get -y install mysql-server-5.7

MYSQL_DATABASE=food_db;
sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -uroot -ptoor -e "CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8mb4"
mysql -uroot -ptoor -e 'show databases;'
sudo service mysql restart
