web-run:
    service.running:
        - name: nginx
        - enable: true
        - reload: true

php-manual-restart:
    cmd.run:
        - name: service php7.0-fpm start
