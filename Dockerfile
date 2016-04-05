FROM ubuntu:xenial

MAINTAINER Andrei Susanu <andrei.susanu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# update system and existing packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove

# install php5 package and popular extensions
RUN apt-get install -y --no-install-recommends \
    php5-fpm php5-cli php5-common php5-curl php5-gd php5-intl php5-json php-mbstring php5-mcrypt php5-mysql php5-pgsql php-soap php5-sqlite php-xml php5-xmlrpc php5-xsl php-zip

# configure php5-fpm as non-daemon
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

# enable some PHP5 modules
RUN php5enmod mcrypt

# php5-fpm will not start if this directory does not exist
RUN mkdir /run/php

# install nginx package
RUN apt-get install -y --no-install-recommends nginx

# configure NGINX as non-daemon
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# install supervisor package
RUN apt-get install -y --no-install-recommends supervisor

# copy config file for Supervisor
COPY config/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# backup default default config for NGINX
RUN cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak

# copy local defualt config file for NGINX
COPY config/nginx/default /etc/nginx/sites-available/default

# add a phpinfo script for debug purposes
RUN echo "<?php phpinfo();" >> /var/www/html/index.php

# NGINX mountable directories for config and logs
VOLUME ["/etc/nginx/conf.d", "/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# NGINX mountable directory for apps
VOLUME ["/var/www"]

# NGINX ports
EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
