FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update && apt-get install -y \
    zip curl unzip  \
    nginx  \
    supervisor \
    php8.1-common \
    php8.1-cli \
    php8.1-fpm \
    php8.1-soap \
    php8.1-pdo \
    php8.1-curl \
    php8.1-pgsql \
    php8.1-mysqli \
    php8.1-memcache \
    php8.1-xml \
    php8.1-mbstring \
    php8.1-xdebug \
    && apt-get remove --purge -y software-properties-common \
    && rm -rf /var/lib/apt/lists/* && apt-get autoremove -y

COPY ./infrastructure /etc/nginx/sites-available

EXPOSE 8081

CMD service php8.1-fpm start && nginx -g "daemon off;"

