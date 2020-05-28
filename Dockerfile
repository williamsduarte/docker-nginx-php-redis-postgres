FROM wyveo/nginx-php-fpm:latest
RUN apt-get update
RUN apt-get install cron --assume-yes
WORKDIR /usr/share/nginx/
RUN rm -rf /usr/share/nginx/html