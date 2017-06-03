Step 1 - Log into the provided system   
	1.1 - Obtain login information from HPE staff   
	1.2 - Login into the system   
```  
	> Get putty from https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe   
	# ssh hpedemo@<ip-address> / password: Discover@2017   
```
Step 2 - Download the source from the git repository, Install on bare metal system / vm   
	2.1 - Clone repository   
	2.2 - Install salt   
	2.3 - Install application on a baremetal system   
	2.4 - Access the application   
```   	
	# git clone https://github.com/vedanta/dmp.git   
	# cd dmp   
	# ./install_minion   
	# sudo salt-call -l info --file-root=/home/hpedemo/dmp --pillar-root=/home/hpedemo/dmp/pillar --config-dir=/home/hpedemo/dmp/conf --local state.apply   
	> in your browser go to http://ipaddress/wordpress/   
```   
Step 3 - Install docker    
```
	# sudo ./install_docker.sh    
	# sudo docker info   
	# sudo docker run hello-world   	
```   
Step 4 - Build a container   
	4.1 - Build the container   
	4.2 - list containers   
```   	
	# sudo docker build -t vedanta/dmp-single:latest -f dmp-single.dockerfile .   
	# sudo docker images -a    
```   
Step 5 - Run container   
	5.1 - stop previous service   
	5.2 - Install packages   
	5.2 - run container   
```
	# sudo /etc/init.d/nginx stop   
	# sudo /etc/init.d/php7.0-fpm stop   
	# sudo /etc/init.d/mysql stop   
	# sudo apt-get install python-pip   
	# sudo pip install docker-py   
	# sudo salt-call -l info --file-root=/home/hpedemo/dmp --pillar-root=/home/hpedemo/dmp/pillar --config-dir=/home/hpedemo/dmp/conf --local state.apply docker-deploy   
	# sudo docker ps -a   
```   
