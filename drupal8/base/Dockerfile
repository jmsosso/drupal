FROM drupal:8.9-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
    cron \
    msmtp msmtp-mta \
    default-mysql-client \
  && rm -rf /var/lib/apt/lists/* /var/www/html

RUN sed 's/exec apache2/startup\napache2/' /usr/local/bin/apache2-foreground -i

COPY startup /usr/local/bin/
COPY 000-default.conf /etc/apache2/sites-enabled/
COPY php.ini /usr/local/etc/php/conf.d/
COPY msmtprc /etc

ENV PATH /var/www/scripts:/var/www/vendor/bin:$PATH
ENV HOME /home/user
ENV ENVIRONMENT production

WORKDIR /var/www/web
