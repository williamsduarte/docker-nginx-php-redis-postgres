FROM wyveo/nginx-php-fpm:php74
WORKDIR /usr/share/nginx/
RUN rm -rf /usr/share/nginx/html