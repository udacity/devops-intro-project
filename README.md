Instructions for Intro to DevOps Project
========================================

Part 0 - Local Installation
###########################

1. Install VirtualBox
2. Install Vagrant
3. Install Packer
4. Install git

Part I - Build Boxes with Packer
################################

1. run 'packer build application-server.json'
2. run 'cd virtualbox'
3. run 'vagrant box add ubuntu-14.04.2-server-amd64-appserver_virtualbox.box --name devops-appserver'
4. run 'vagrant up'
5. run 'vagrant ssh' to connect to the server
6. In the server run:
   git init
   git remote add https://github.com/chef/devops-kungfu.git
   git fetch

   This kungfu repo will be replaced with a lighter (smaller) version in Udacity repo later on
   Now you can run tests -  'cd ~/devops-kungfu; grunt -v'
7. Open localhost:8080 from your main machine.
