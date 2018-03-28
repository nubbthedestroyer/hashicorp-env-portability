sudo rm -rf /etc/nginx/sites-enabled/default
sudo chmod -R 777 /etc/nginx


sudo -s echo "server {
    listen ${VAGRANT_IP}:8080;
    location / {
    proxy_pass http://127.0.0.1:8080;
    }
}" > /etc/nginx/sites-available/reverse-proxy-1.config


sudo -s echo "server {
    listen ${VAGRANT_IP}:8082;
    location / {
    proxy_pass http://127.0.0.1:8082;
    }
}" > /etc/nginx/sites-available/reverse-proxy-2.config


sudo ln -sf /etc/nginx/sites-available/reverse-proxy-1.config /etc/nginx/sites-enabled/reverse-proxy-1.config
sudo ln -sf /etc/nginx/sites-available/reverse-proxy-2.config /etc/nginx/sites-enabled/reverse-proxy-2.config

sudo service nginx restart
