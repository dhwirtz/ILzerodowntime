FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libxml2-dev \
    libzip-dev \
    libxslt-dev \
    libonig-dev \
    zip \
    unzip

RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    gd \
    mbstring \
    zip \
    soap \
    bcmath \
    intl \
    xsl \
    sockets \
    pcntl

RUN pecl install redis && docker-php-ext-enable redis

WORKDIR /var/www/html

COPY php.ini /usr/local/etc/php/conf.d/magento.ini

RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer