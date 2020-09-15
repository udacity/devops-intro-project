#!/bin/bash -eux

# JDK and JRE are required for Jenkins
apt-get install -y software-properties-common # Installs add-apt-repository in 14.04
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y \
  openjdk-8-jre \
  openjdk-8-jre-headless \
  openjdk-8-jdk \
  dos2unix \
  zip \
  unzip

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

apt-get update
apt-get install -y jenkins
apt-get upgrade

# copy premade configuration files
# jenkins default config, to set --prefix=jenkins
cp -f /tmp/jenkins-config/jenkins /etc/default
# fix dos newlines for Windows users
dos2unix /etc/default/jenkins
# install some extra plugins
/bin/bash /tmp/jenkins-config/install_jenkins_plugins.sh
# jenkins security and pipeline plugin config
cp -f /tmp/jenkins-config/config.xml /var/lib/jenkins
# set up username for vagrant
mkdir -p /var/lib/jenkins/users/vagrant
cp /tmp/jenkins-config/users/vagrant/config.xml /var/lib/jenkins/users/vagrant
# example job
mkdir -p /var/lib/jenkins/jobs
cd /var/lib/jenkins/jobs
tar zxvf /tmp/jenkins-config/example-job.tar.gz

# set permissions or else jenkins can't run jobs
chown -R jenkins:jenkins /var/lib/jenkins

# restart for jenkins to pick up the new configs
service jenkins restart
