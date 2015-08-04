Instructions for Intro to DevOps Project
========================================

## Part 0 - Local Installation

1. Install VirtualBox
2. Install Vagrant
3. Install Packer
4. Install git

## Part I - Build Boxes with Packer

### To make an image for local development
1. run 'packer build -only=virtualbox-iso application-server.json'
2. run 'cd virtualbox'
3. run 'vagrant box add ubuntu-14.04.2-server-amd64-appserver_virtualbox.box --name devops-appserver'
4. run 'vagrant up'
5. run 'vagrant ssh' to connect to the server


### To make application server image for cloud
1. Set up your cloud provider credentials. 

   See additional information in the appropriate directories:
   aws/ - for Amazon Web Services. Builder type 'amazon-ebs'
   google/ - for Google Cloud Platform. Builder type 'googlecompute'
   azure/ - for Microsoft Azure. Builder type 'azure'. 
            It will require additional installation.

2. pick the builder for the cloud provider you set up in step 1 and
   run 'packer build -only="your builder type" application-server.json'
   for example 'packer build -only=amazon-ebs application-server.json'

3. cd to your cloud providers directory
4. run 'vagrant up'
5. run 'vagrant ssh' to connect to the server

### To make control (CI and monitoring) server image for cloud
1. Set up your cloud provider credentials.
2. pick the builder for the cloud provider you set up in step 1 and
   run 'packer build -only="your builder type" control-server.json'


## Part II - Cloning, Developing and Running the web application

1. On your local machine go to the root directory of this repository
   run 'git clone https://github.com/chef/devops-kungfu.git devops-kungfu'

2. In the VM run:
	'cd devops-kungfu'
	Install app specific node packages: 'sudo npm install'
   Now you can run tests -  'grunt -v'

7. Open localhost:8080 from your local machine.
