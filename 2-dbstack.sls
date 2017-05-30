# this install db stack and needed components
mysql_setup:
    debconf.set:
        - name: mysql-server
        - data:
             'mysql-server/root_password': {'type': 'password', 'value': '{{ salt['pillar.get']('mysql:root_pw') }}'}
             'mysql-server/root_password_again': {'type': 'password','value': '{{ salt['pillar.get']('mysql:root_pw') }}' }
mysql-server:
    pkg:
        - installed
        - require:
            - debconf: mysql_setup
python-mysqldb:
    pkg:
        - installed


fix-mysql-bind:
    file.comment:
        - name: /etc/mysql/mysql.conf.d/mysqld.cnf
        - regex: ^bind-address

fix-mysql-packet:
    file.replace:
        - name: /etc/mysql/mysql.conf.d/mysqld.cnf
        - pattern: 'max_allowed_packet\s*=\s16M'
        - repl: 'max_allowed_packet=100M'
