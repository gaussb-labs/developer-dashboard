#!/bin/bash
sudo adduser --disabled-password --gecos '' $1

sudo mkdir -p /home/$1/.ssh/
sudo touch /home/$1/.ssh/authorized_keys

sudo echo $2 $3 $4 > authorized_keys
sudo mv authorized_keys /home/$1/.ssh/

sudo chown -R $1:$1 /home/$1/.ssh
sudo chown -R $1:$1 /home/$1/.ssh/authorized_keys

sudo chmod 700 /home/$1/.ssh/
sudo chmod 600 /home/$1/.ssh/authorized_keys


