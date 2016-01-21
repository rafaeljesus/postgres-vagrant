#!/bin/bash

#echo "******************"
#echo "Install PostgreSQL"
#echo "******************"

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

apt-get update
apt-get -y install postgresql-9.4 postgresql-contrib postgresql-client
sudo -u postgres createdb estate
sudo -u postgres createdb estate_development
sudo -u postgres createdb estate_test

sed -i "/#listen_addresses /s/^/listen_addresses = '*' /" /etc/postgresql/9.4/main/postgresql.conf
echo "host  all   all   10.0.2.2/24     trust" >> /etc/postgresql/9.4/main/pg_hba.conf
sudo -u postgres createuser -S -D -R -e estate
service postgresql restart
