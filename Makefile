.PHONY: *

all: init 

build-base:
	docker build -t build-env -f Dockerfile.build .

init:
	mv includes/dist-configure.php includes/configure.php 
	mv admin/includes/dist-configure.php admin/includes/configure.php

reset:
	rm -r zc_install
	sed -i "s/'http:\/\/localhost'/'http:\/\/$$(curl checkip.amazonaws.com)'/" includes/configure.php
	sed -i "s/'https:\/\/localhost'/'http:\/\/$$(curl checkip.amazonaws.com)'/" includes/configure.php
	sed -i "s/'\/var\/www\/vhost\/accountname\/public_html\/store\/'/'\/var\/www\/html\/'/" includes/configure.php
	sed -i "s/'DB_PREFIX', ''/'DB_PREFIX', 'oc_'/" includes/configure.php
	sed -i "s/'DB_SERVER', 'localhost'/'DB_SERVER', 'mariadb'/" includes/configure.php
	sed -i "s/'DB_SERVER_USERNAME', ''/'DB_SERVER_USERNAME', 'root'/" includes/configure.php
	sed -i "s/'DB_SERVER_PASSWORD', ''/'DB_SERVER_PASSWORD', 'mariaSql'/" includes/configure.php
	sed -i "s/'DB_DATABASE', ''/'DB_DATABASE', 'zencart'/" includes/configure.php
	cp includes/configure.php admin/includes/configure.php
	mv admin myadmin
	docker exec mariadb sh -c 'exec mysql -uroot -pmariaSql < /opt/zencart.sql' 
	docker exec -it zencart chown -R www-data:www-data /var/www/html
	echo "Admin password ngTIV8yh"
	echo "admin path /myadmin"
	
up: 
	docker-compose up -d

down:
	docker-compose down
