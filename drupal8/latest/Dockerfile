FROM drupal:8-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
    cron \
    ssmtp \
    mysql-client \
  && rm -rf /var/lib/apt/lists/* /var/www/html/*

RUN sed 's/exec apache2/startup\napache2/' /usr/local/bin/apache2-foreground -i

COPY startup /usr/local/bin/
COPY php.ini /usr/local/etc/php/conf.d/
COPY ssmtp.conf /etc/ssmtp

ENV PATH /var/www/scripts:/var/www/vendor/bin:$PATH
ENV HOME /home/user
ENV ENVIRONMENT production

WORKDIR /var/www/html
