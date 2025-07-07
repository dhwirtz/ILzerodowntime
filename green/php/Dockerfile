FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libxml2-dev \
    libzip-dev \
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
    intl

RUN pecl install redis && docker-php-ext-enable redis

WORKDIR /var/www/html

COPY ./app /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer