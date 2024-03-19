#!/bin/bash

# create ssl key
/usr/bin/openssl req -new -newkey rsa:2048 -nodes -keyout $KEY_PATH -out $CERT_REQ_PATH -subj "/C=KR/L=Seoul/O=42Seoul/OU=student/CN=bohlee"
/usr/bin/openssl x509 -req -days 365 -in $CERT_REQ_PATH -signkey $KEY_PATH -out $CERT_PATH

# nginx setting
rm -f /etc/nginx/sites-available/default.bak
echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    root /var/www/html;
    index index.php;
    server_name bohlee.42.fr www.bohlee.42.fr;

    ssl_certificate $CERT_PATH;
    ssl_certificate_key $KEY_PATH;
    ssl_protocols TLSv1.3;

    location ~ \\.php\$ {
    	    try_files \$uri \$uri/ =404;
            fastcgi_pass wordpress:9000;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            include fastcgi_params;
    }
}
" > /etc/nginx/sites-available/default

# nginx start
/usr/sbin/nginx -g "daemon off;"
