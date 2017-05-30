# configure the webserver

www disable:
    file.absent:
        - name: /etc/nginx/sites-available/default

www disable default:
    file.absent:
        - name: /etc/nginx/sites-enabled/default

www delete:
    file.absent:
        - name: /var/www/html

www create documentroot:
    file.directory:
        - name: /var/www/sampleapp

www create snippets:
    file.directory:
        - name: /etc/nginx/snippets
        - user: root
        - group: root
        - mode: 600

www file sampleapp:
    file.managed:
        - name: /etc/nginx/sites-available/sampleapp
        - source: salt://templates/sampleapp.tpl
        - user: www-data
        - group: www-data
        - mode: 600
        - template: jinja

www file fastcgi.conf:
    file.managed:
        - name: /etc/nginx/fastcgi.conf
        - source: salt://files/fastcgi.conf
        - user: root
        - group: root
        - mode: 600

www file fastcgi-php.conf:
    file.managed:
        - name: /etc/nginx/snippets/fastcgi-php.conf
        - source: salt://files/fastcgi-php.conf
        - user: root
        - group: root
        - mode: 600

www conf symlink:
   file.symlink:
        - name: /etc/nginx/sites-enabled/sampleapp
        - target: /etc/nginx/sites-available/sampleapp

