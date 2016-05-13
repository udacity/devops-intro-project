Instructions for Practice Project
========================================

These instructions assume familiarity with Git and GitHub. If you are not comfortable with those tools, please complete Udacity's [How to Use Git and GitHub](https://www.udacity.com/course/how-to-use-git-and-github--ud775) course before proceeding. 

## Setting up your local machine

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
*  Install [Vagrant](https://www.vagrantup.com/downloads.html)
* Install [Packer](https://www.packer.io/downloads.html)
* Fork this repository on GitHub and clone it to your local machine

## Part I: Build Boxes with Packer

From the packer-templates directory on your local machine:

* run `packer build -only=virtualbox-iso application-server.json`. You may see various timeouts and errors:

```
read: operation timed out
==> virtualbox-iso: ISO download failed.
Build 'virtualbox-iso' errored: ISO download failed.

checksums didn't match expected
==> virtualbox-iso: ISO download failed.
Build 'virtualbox-iso' errored: ISO download failed.

==> Some builds didn't complete successfully and had errors:
--> virtualbox-iso: ISO download failed.
```

If you do, retry the command until the ISO download succeeds.

* run `cd virtualbox`
* run `vagrant box add ubuntu-14.04.4-server-amd64-appserver_virtualbox.box --name devops-appserver`
* run `vagrant up`
* run `vagrant ssh` to connect to the server


## Part II: Cloning, Developing and Running the web application

* On your local machine go to the root directory of this repository
* run `git clone https://github.com/chef/devops-kungfu.git devops-kungfu`
* Open http://localhost:8080 from your local machine to see the app running.
* In the VM, run `cd devops-kungfu`
* To install app specific node packages, run `sudo npm install`. You may see several errors; they can be ignored for now.
* Now you can run tests - `grunt -v`. The tests will run, then quit with an error. 

### Troubleshooting

If you encounter errors with Ubuntu version numbers not being available or checksum errors on Ubuntu,it means that this repository has not yet been updated for the latest Ubuntu version. Feel free to mention this in the [forum](https://discussions.udacity.com/c/nd012-p1-intro-to-devops/nd012-the-devops-environment). Meanwhile, you can fix this error for yourself by editing the contents of the `application-server.json` and `control-server.json` template files inside the `packer-templates` folder

* Find the newest version number and checksum from the [Ubuntu website for this release](http://releases.ubuntu.com/trusty/)
* Edit `PACKER_BOX_NAME` and `iso_checksum` in the template files to match that version number and checksum.