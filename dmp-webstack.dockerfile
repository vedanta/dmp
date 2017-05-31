FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl wget sudo
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3 xenial main" >> /etc/apt/sources.list.d/saltstack.list
RUN apt-get update
RUN apt-get install -y salt-minion salt-master salt-syndic salt-common salt-cloud salt-api
RUN sed -i -e "s/#file_client: remote/file_client: local/g" /etc/salt/minion
ADD . /srv/salt
## call dmp state files
#
RUN salt-call -l info --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply 1-common
RUN salt-call -l info --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply 3-webstack
RUN salt-call -l info --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply 5-webstack-conf
RUN salt-call -l info --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply 6-application-source-download
RUN salt-call -l info --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply 7-application-conf
#
##
COPY ./dmp-webstack-entrypoint.sh ./dmp-webstack-entrypoint.sh
EXPOSE 80
ENTRYPOINT ["./dmp-webstack-entrypoint.sh"]
