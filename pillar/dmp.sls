sampleapp:
    - name: wordpress
    - documentroot: /var/www/sampleapp
    - archivename: latest.tar.gz
    - archivesource: https://wordpress.org/latest.tar.gz
    - servername: sampleapp.int
mysql:
    - database: wordpress
    - username: wordpress_user
    - password: wordpress_user
    - root_pw: root_password
    - host: localhost
    # - host: 192.168.86.184
docker:
    - reponame: hpetest
    - tag: latest
