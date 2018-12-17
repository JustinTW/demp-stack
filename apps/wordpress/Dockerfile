FROM php:7.2-apache

# install apt/base
ADD .docker/requirements /tmp/reqs
RUN apt-get update && apt-get install -q -y --force-yes --fix-missing \
  $(grep -vE "^\s*#" /tmp/reqs/apt/base | tr "\n" " ") \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install php/base
ADD .docker/requirements /tmp/reqs
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) $(grep -vE "^\s*#" /tmp/reqs/php/base | tr "\n" " ") \
  && rm -rf /tmp/* /var/tmp/*

# install pecl/dev
ADD .docker/requirements /tmp/reqs
RUN pecl install $(grep -vE "^\s*#" /tmp/reqs/pecl/dev | tr "\n" " ") \
  && docker-php-ext-enable $(grep -vE "^\s*#" /tmp/reqs/pecl/dev | tr "\n" " ") \
  && rm -rf /tmp/* /var/tmp/*

# download wordpress
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wp.tgz \
  && tar -xzvf /tmp/wp.tgz \
  && mv wordpress/* . \
  && rm -rf wordpress /tmp/* /var/tmp/*
