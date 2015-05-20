#!/bin/bash -eux

apt-get -y install nginx
sed -i -e '0,/root \/usr\/share\/nginx\/html/s//root \/home\/vagrant\/devops-kungfu/' /etc/nginx/sites-available/default


# install git, needed for acquiring webapp source code
apt-get -y install git

# remove old node just in case
apt-get remove --purge node

# application and build process required packages
# add Node.js maintained repositories
curl -sL https://deb.nodesource.com/setup | bash -

# for tests and build
apt-get -y install nodejs
# for phantomjs
apt-get -y install libfontconfig1 fontconfig libfontconfig1-dev libfreetype6-dev

# for sass
apt-get -y install ruby
gem install sass

#for running grunt tasks manually
npm install -g grunt-cli

# install some additional packeges required by the app
npm install -g lru-cache sigmund
npm install -g accepts batch
npm install -g qunitjs

# reload nginx to serve from the directory
service nginx reload

echo 'Environment is ready, you should fork and clone the repo now.'