FROM drupal:8.2-apache
MAINTAINER Juan M. Sosso <juan@servinube.net>

RUN apt-get update && apt-get install --no-install-recommends -y \
    cron \
    ssmtp \
    mysql-client \
  && rm -rf /var/lib/apt/lists/* /var/www/html

RUN { \
    echo '@reboot root     chmod a+w /var/www/private /var/www/web/files'; \
    echo '@hourly www-data /var/www/vendor/bin/drush -r /var/www/web cron -q'; \
  } | tee --append "/etc/crontab" \
  && sed 's/exec apache2/cron\napache2/' /usr/local/bin/apache2-foreground -i

COPY 000-default.conf /etc/apache2/sites-enabled/
COPY php.ini /usr/local/etc/php/conf.d/
COPY ssmtp.conf /etc/ssmtp

ENV PATH /var/www/scripts:/var/www/vendor/bin:$PATH
ENV HOME /home/user

WORKDIR /var/www/web