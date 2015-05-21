#!/bin/bash -eux

mkdir -p /home/vagrant/.ssh
curl -L -k 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -o /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

# Set up password-less sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/99_vagrant
chmod 440 /etc/sudoers.d/99_vagrant

# vagrant prefers no tty
echo "Defaults !requiretty" >> /etc/sudoers