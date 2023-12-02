FROM php:8.0.20-fpm

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/html/api

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libzip-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    openssl \
    libssl-dev \
    libxml2-dev \
    curl && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install sockets pdo_mysql zip exif soap

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Copy application folder
COPY --chown=www-data:www-data ./api /var/www/html/api

RUN chown -R www-data:www-data /var/www/html/api
RUN chmod -R 775 /var/www/html/api/storage
RUN cd /var/www/html/api
RUN composer install
RUN composer update
RUN php artisan config:cache
RUN php artisan migrate
RUN composer dump-autoload

USER www-data
EXPOSE 9000
CMD ["php-fpm"]

