# Base OS
FROM debian:buster

# Copy files
COPY srcs/nginx.conf ./root/
COPY srcs/start.sh ./root/
COPY srcs/latest.tar.gz ./root/
COPY srcs/wp-config.php ./root/
COPY srcs/mysql.sh ./root/
COPY srcs/start.sh ./root/

# Install utilities
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install default-mysql-server
RUN apt-get -y install php php-mysql php-fpm php-cli php-mbstring

# Configure nginx
RUN service nginx start
RUN cp /root/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# Configure MySQL
RUN bash root/mysql.sh

# Configure PHP


# Copy Wordpress files
RUN tar xzvf /root/latest.tar.gz
RUN cp -a /wordpress/. /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html
RUN cp /root/wp-config.php /var/www/html/wordpress/

# Install SSL certifier
RUN wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64
RUN chmod +x mkcert
RUN mv mkcert /usr/local/bin
RUN mkcert -install

# Get SSL certificate
RUN mkcert localhost
RUN cp localhost.pem /etc/nginx/
RUN cp localhost-key.pem /etc/nginx/

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Launch script
CMD bash root/start.sh
