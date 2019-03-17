FROM php:7.3.0-apache

RUN apt-get update
 
RUN apt-get install -y vim less
 
# (2)
RUN set -ex apk --no-cache add postgresql-dev libpq-dev
RUN apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql mbstring
 
# (3)
# COPY ./php.ini /usr/local/etc/php/

# Create image
# docker build ./ -t php_apache_image:ver001

# Run docker
# docker run -d -p 80:80 -v /Users/ayaka/Documents/SunHigh105.github.io/php_schedule/html:/var/www/html --name php_apache_container php_apache_image:ver001

# Check container
# docker ps -a

# Access below path
# localhost/

# Stop container
# docker stop [CONTAINER ID]

# Restart container
# docker restart [CONTAINER ID]