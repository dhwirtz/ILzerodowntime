FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && docker-php-ext-install pdo_mysql mysqli \
    && rm -rf /var/lib/apt/lists/*

RUN echo "pdo_mysql.default_socket=/var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libxml2-dev \
    libzip-dev \
    libxslt-dev \
    libonig-dev \
    zip \
    unzip \
    mariadb-client \
    redis-tools

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