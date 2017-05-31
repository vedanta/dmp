# sets up database users and settings
root:
    mysql_user.present:
        - host: localhost
        - password: {{ salt['pillar.get']('mysql:root_pw') }}
        - connection_user: root

create database:
    mysql_database.present:
        - name: {{ salt['pillar.get']('mysql:database') }}
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}

mysql user create:
    mysql_user.present:
        - name: {{ salt['pillar.get']('mysql:username') }}
        - password: {{ salt['pillar.get']('mysql:password') }}
        - host: '%'
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}
        - allow_passwordless: false
        - require:
            - mysql_database: create database

mysql user create localhost:
    mysql_user.present:
        - name: {{ salt['pillar.get']('mysql:username') }}
        - password: {{ salt['pillar.get']('mysql:password') }}
        - host: 'localhost'
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}
        - allow_passwordless: false
        - require:
            - mysql_database: create database


mysql user grants:
    mysql_grants.present:
        - name: {{ salt['pillar.get']('mysql:username') }}
        - grant: all privileges
        - host: '%'
        - database: {{ salt['pillar.get']('mysql:database') }}.*
        - user: {{ salt['pillar.get']('mysql:username') }}
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}
        - require:
            - mysql_database: create database
            - mysql_user: mysql user create

mysql user grants localhost:
    mysql_grants.present:
        - name: {{ salt['pillar.get']('mysql:username') }}
        - grant: all privileges
        - host: 'localhost'
        - database: {{ salt['pillar.get']('mysql:database') }}.*
        - user: {{ salt['pillar.get']('mysql:username') }}
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}
        - require:
            - mysql_database: create database
            - mysql_user: mysql user create

flush:
    mysql_query.run:
        - query: " FLUSH PRIVILEGES;"
        - connection_host:  localhost
        - connection_user: root
        - connection_pass: {{ salt['pillar.get']('mysql:root_pw') }}
        - database: mysql

