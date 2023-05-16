FROM php:8.1.6-fpm

USER root

RUN apt-get update

#Copy www.conf to give php hint which user sould it use to run code
COPY ./www1.conf /usr/local/etc/php-fpm.d/www1.conf

WORKDIR /var/www/html

CMD ["php-fpm"]