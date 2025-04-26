# Use official PHP image with Apache
FROM php:8.1-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Copy project files to the Apache web root
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 to the outside world
EXPOSE 80
