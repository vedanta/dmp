# webstack for dmp

## new ppa for php
# More details in https://launchpad.net/~ondrej/+archive/ubuntu/php
#
php_repo:
    pkgrepo.managed:
        - humanname: PHP 7.0 Repository for Ubuntu (Xenial)
        - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main 
        - file: /etc/apt/sources.list.d/ondrej-php70-trusty.list
        - keyid: E5267A6C 
        - keyserver: keyserver.ubuntu.com
##
# install nginx
install web stack:
    pkg.installed:
        - refresh: true
        - pkgs:
                - nginx
                - php7.0-common
                - php7.0-mysql
                - php7.0-fpm
                - php7.0-cli
                - php7.0-mbstring
                - php7.0-dev
                - php7.0-mcrypt
                - php7.0-xml
                - php-mongo
                - php-mongodb
                - php-pear
                - libcurl4-openssl-dev
                - pkg-config
                - libssl-dev
                - libsslcommon2-dev
                - libpcre3-dev
                - build-essential
                - nodejs
                - nodejs-legacy
                - zip
                - unzip

#install php mongodb:
#   pecl.installed: 
#        - name: mongodb

#install pecl zip:
#    pecl.installed:
#        - name: zip

# adds the zip.so extension to php.ini
#/etc/php/7.0/fpm/php.ini:
#    file.append:
#        - text:
#            - "extension=zip.so"


# install npm
#npm:
#    pkg.installed
#git:
#    pkg.installed


# install bower (using npm)
#bower:
#    npm.installed
# install yarn
#yarn:
#    npm.installed

