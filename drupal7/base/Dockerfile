FROM drupal:7.59-apache

RUN apt-get update && apt-get install --no-install-recommends -y \
    cron \
    ssmtp \
    mysql-client \
  && rm -rf /var/lib/apt/lists/*

# Install composer & drush
ENV COMPOSER_HOME=/usr/src/composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
COPY composer.json /usr/src/composer/
RUN composer global update
ENV PATH /usr/src/composer/vendor/bin:$PATH

RUN sed 's/exec apache2/startup\napache2/' /usr/local/bin/apache2-foreground -i

COPY startup /usr/local/bin/
COPY php.ini /usr/local/etc/php/conf.d/
COPY ssmtp.conf /etc/ssmtp
