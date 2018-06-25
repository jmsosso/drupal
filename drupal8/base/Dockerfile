FROM drupal:8.5-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
    cron \
    ssmtp \
    mysql-client \
  && rm -rf /var/lib/apt/lists/* /var/www/html

RUN { \
    echo '@reboot root     chmod -R a+rw /var/www/private /var/www/web/sites/default/files'; \
    echo '@hourly www-data /var/www/vendor/bin/drush -q -r /var/www/web cron'; \
  } | tee --append "/etc/crontab" \
  && sed 's/exec apache2/cron\napache2/' /usr/local/bin/apache2-foreground -i

COPY 000-default.conf /etc/apache2/sites-enabled/
COPY php.ini /usr/local/etc/php/conf.d/
COPY ssmtp.conf /etc/ssmtp

ENV PATH /var/www/scripts:/var/www/vendor/bin:$PATH
ENV HOME /home/user
ENV ENVIRONMENT production

WORKDIR /var/www/web
