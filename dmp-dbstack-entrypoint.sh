#!/bin/bash

# start dbstack
/etc/init.d/mysql stop
# fix directory permissions
chown -Rv  mysql:mysql /var/lib/mysql
chown -Rv mysql:mysql /var/log/mysql
usermod -d /var/lib/mysql mysql
# init mysql
mysqld --initialize-insecure --user=mysql
service mysql restart

# populate the required specifics for dbstack

salt-call -l info --pillar-root=/srv/salt/pillar --file-root=/srv/salt state.apply 4-dbstack-conf-docker

echo "DMP ** started!"

# allows the container not to detatch
tail -f  /var/log/mysql/error.log

