FROM servinube/drupal:latest

RUN apt-get update && apt-get install --no-install-recommends -y \
    unzip \
  && rm -rf /var/lib/apt/lists/*

COPY php.ini /usr/local/etc/php/conf.d/
COPY ssmtp.conf /etc/ssmtp

# Install xDebug
RUN yes | pecl install xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/

ENV ENVIRONMENT develop
