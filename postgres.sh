#!/bin/bash

#echo "******************"
#echo "Install PostgreSQL"
#echo "******************"

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

apt-get update
apt-get -y install postgresql-9.4 postgresql-contrib postgresql-client

sed -i "/#listen_addresses /s/^/listen_addresses = '*' /" /etc/postgresql/9.4/main/postgresql.conf
echo "host  all   all   10.0.2.2/24     trust" >> /etc/postgresql/9.4/main/pg_hba.conf
service postgresql restart
