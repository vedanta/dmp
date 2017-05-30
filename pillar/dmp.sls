sampleapp:
    - documentroot: /var/www/sampleapp
    - app_environment: local
    - app_debug: true
    - app_url: http://sampleapp.site
    - servername : sampleapp.site
    - hostname: sampleapp.int
mysql:
    - database: wordpress
    - username: wordpress_user
    - password: wordpress_user
    - root_pw: root_password
