# webstack init
#
php-serve:
    service.running:
        - name: php7.0-fpm
        - enable: true
        - reload: true
        - listen_in:
            - service: www-serve
www-stop:
    service.dead:
        - name: nginx
www-serve:
    service.running:
        - name: nginx
        - enable: true
        - reload: true
