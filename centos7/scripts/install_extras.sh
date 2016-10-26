#!/usr/bin/env bash
EXTRAS=/tmp/extras
sudo rpm -ivh $EXTRAS/jdk-8u111-linux-x64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

sudo mv $EXTRAS/oracle_profile.sh /etc/profile.d