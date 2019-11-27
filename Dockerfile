# Base OS
FROM debian:buster

# Copy files
COPY srcs/nginx.conf ./root/
COPY srcs/latest.tar.gz ./root/
COPY srcs/wp-config.php ./root/
COPY srcs/config.inc.php ./root/
COPY srcs/wordpress.sql ./root/
COPY srcs/mysql.sh ./root/
COPY srcs/start.sh ./root/

# Install utilities
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install default-mysql-server
RUN apt-get -y install php php-mysql php-fpm php-cli php-mbstring php-zip php-gd

# Install PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/html/phpmyadmin

# Install SSL certifier
RUN wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64
RUN chmod +x mkcert
RUN mv mkcert /usr/local/bin
RUN mkcert -install

# Configure nginx
RUN service nginx start
RUN cp /root/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# Configure PHPMyAdmin
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chown -R www-data:www-data /var/lib/phpmyadmin
RUN cp /root/config.inc.php /var/www/html/phpmyadmin/

# Configure MySQL
RUN bash root/mysql.sh

# Copy Wordpress files
RUN tar xzvf /root/latest.tar.gz
RUN cp -a /wordpress/. /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html
RUN cp /root/wp-config.php /var/www/html/wordpress/

# Get SSL certificate
RUN mkcert localhost
RUN mv localhost.pem /etc/nginx/
RUN mv localhost-key.pem /etc/nginx/

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Launch script
CMD bash root/start.sh
