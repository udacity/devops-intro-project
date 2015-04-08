#!/bin/bash -eux

# JDK and JRE are required

apt-get install openjdk-7-jre openjdk-7-jdk 

wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

apt-get update
apt-get install jenkins

