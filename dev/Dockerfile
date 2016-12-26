FROM servinube:drupal
MAINTAINER Juan M. Sosso <juan@servinube.net>

COPY php.ini /usr/local/etc/php/conf.d/
#COPY ssmtp.conf /etc/ssmtp

# Install xDebug
RUN yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini

ENV ENVIRONMENT develop
