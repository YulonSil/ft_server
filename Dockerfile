FROM debian:buster
COPY srcs/nginx.conf ./root/
COPY srcs/start.sh ./root/
COPY srcs/latest.tar.gz ./root/
COPY srcs/wp-config.php ./root/
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install default-mysql-server
RUN apt-get -y install php-fpm
RUN apt-get -y install php-json
RUN apt-get -y install php-opcache
RUN apt-get -y install php-mysql
RUN apt-get -y install php-xml
RUN apt-get -y install php-mbstring
RUN apt-get -y install php-cli
RUN apt-get -y install php-gd
RUN apt-get -y install php-curl
RUN wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64
RUN chmod +x mkcert
RUN mv mkcert /usr/local/bin
RUN mkcert -install
RUN mkcert localhost
RUN tar xzvf /root/latest.tar.gz
RUN cp -a /wordpress/. /var/www/localhost
RUN chown -R www-data:www-data /var/www/localhost
RUN cp /root/wp-config.php /var/www/localhost/
RUN cp localhost.pem /etc/nginx/
RUN cp localhost-key.pem /etc/nginx/
RUN cp /root/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default
EXPOSE 80
EXPOSE 443
CMD bash root/start.sh
