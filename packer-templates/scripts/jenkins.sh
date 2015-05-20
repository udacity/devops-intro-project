#!/bin/bash -eux

# JDK and JRE are required for Jenkins
apt-get install -y openjdk-7-jre openjdk-7-jdk 

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

apt-get update
apt-get install -y jenkins
apt-get upgrade

# copy premade configuration files
# jenkins default config, to set --prefix=jenkins
cp -f /tmp/jenkins-config/jenkins /etc/defaults
# jenkins security and pipeline plugin config
cp -f /tmp/jenkins-config/config.xml /var/lib/jenkins
# set up username for vagrant
mkdir /var/lib/jenkins/users/vagrant
cp /tmp/jenkins-config/users/vagrant/config.xml /var/lib/jenkins/users/vagrant
# example job
cd /tmp/jenkins-config
tar zxvf /tmp/jenkins-config/example-job.tar.gz
cp -Rf /tmp/jenkins-config/git-example /var/lib/jenkins/jobs


# set permissions or else jenkins can't run jobs
chown -R jenkins:jenkins /var/lib/jenkins

# restart for jenkins to pick up the new configs
service jenkins restart