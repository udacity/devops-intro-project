#!/bin/bash -eux

apt-get -y install nginx
# create jenkins and graphite config for nginx
cat <<EOF > /etc/nginx/sites-available/manage
upstream jenkins_server {
    server 127.0.0.1:8080 fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80 default ipv6only=on;
 

    location /jenkins {
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$http_host;
        proxy_redirect off;

        if (!-f \$request_filename) {
            proxy_pass http://jenkins_server;
            break;
        }
    }


    location  / {
        include uwsgi_params;
        uwsgi_pass 127.0.0.1:3031;
    }

}
EOF

# remove default nginx config
rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
# enable jenkins instead
ln -s /etc/nginx/sites-available/manage /etc/nginx/sites-enabled/

service nginx restart