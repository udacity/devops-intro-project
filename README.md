Instructions for Practice Project
========================================

These instructions assume familiarity with Git and GitHub. If you are not comfortable with those tools, please complete Udacity's [How to Use Git and GitHub](https://www.udacity.com/course/how-to-use-git-and-github--ud775) course before proceeding. 

After installing the required tools, you will need to ensure that your computer can find the executables to run them. For this, you might need to modify the PATH environment variable. A good overview is at [superuser.com](https://superuser.com/questions/284342/what-are-path-and-other-environment-variables-and-how-can-i-set-or-use-them). You may need to search the web for instructions on how to set the PATH variable for your specific operating system and version. 

## Setting up your local machine

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant](https://www.vagrantup.com/downloads.html)
* Install [Packer](https://www.packer.io/downloads.html)
* Fork this repo to your own account
* Clone the forked repo to your local machine using this command: `git clone http://github.com/<account-name>/devops-intro-project devops`, replacing `<account-name>` with your GitHub username.

## Part I: Building a box with Packer

From the packer-templates directory on your local machine:

* Run `packer build -only=virtualbox-iso application-server.json`. You may see various timeouts and errors, as shown below. If you do, retry the command until the ISO download succeeds:

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

* Run `cd virtualbox`
* Run `vagrant box add ubuntu-14.04.5-server-amd64-appserver_virtualbox.box --name devops-appserver`
* Run `vagrant up`
* Run `vagrant ssh` to connect to the server


## Part II: Cloning, developing, and running the web application

* On your local machine go to the root directory of the cloned repository 
* Run `git clone https://github.com/chef/devops-kungfu.git devops-kungfu`
* Open http://localhost:8080 from your local machine to see the app running.
* In the VM, run `cd devops-kungfu`
* To install app specific node packages, run `sudo npm install`. You may see several errors; they can be ignored for now.
* Now you can run tests with the command `grunt -v`. The tests will run, then quit with an error. 

### Troubleshooting

If you encounter errors with Ubuntu version numbers not being available or checksum errors on Ubuntu,it means that this repository has not yet been updated for the latest Ubuntu version. Feel free to mention this in the [forum](https://discussions.udacity.com/c/nd012-p1-intro-to-devops/nd012-the-devops-environment). Meanwhile, you can fix this error for yourself by editing the contents of the `application-server.json` and `control-server.json` template files inside the `packer-templates` folder.

* Find the newest version number and checksum from the [Ubuntu website for this release](http://releases.ubuntu.com/trusty/)
* Edit `PACKER_BOX_NAME` and `iso_checksum` in the template files to match that version number and checksum.
