# Drush Docker Container
FROM debian:jessie

RUN apt-get update && \
  apt-get install -y vim s3cmd php5-curl php5-mysql curl php-codecoverage phpunit phpunit-mock-object mysql-client ca-certificates git --no-install-recommends

RUN curl -Ss https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*
RUN npm install -g bower

# Install Drush using Composer
RUN composer global require drush/drush:6.*

# Setup the symlink
USER root

RUN ln -sf /root/.composer/vendor/bin/drush.php /usr/local/bin/drush