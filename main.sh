	#/bin/bash

	Wordpress()
	{
	clear
	echo "This is Wordpress $(wp core version)"
	echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) is $(awk -F"'" '/DB_PASSWORD/{print $4}' wp-config.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' wp-config.php) $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) > $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php).$(whoami).$(date +%F).sql"
	ls -1t | head -1 | grep *.sql
	}

	Prestashop()
	{
	clear
	if test -f "config/settings.inc.php"; then echo "This is Prestashop $(awk -F"'" '/PS_VERSION/{print $4}' config/settings.inc.php) installed on $(awk -F"'" '/PS_CREATION_DATE/{print $4}' config/settings.inc.php)" ;fi 
	echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) is $(awk -F"'" '/DB_PASSWD_/{print $4}' config/settings.inc.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' config/settings.inc.php) $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) > $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php).$(whoami).$(date +%F).sql"
	ls -1t | head -1 | grep *.sql
	}


	#Joomla
	
	if test -f "configuration.php"; then echo "This is Joomla. I got nothin ¯\_(ツ)_/¯ " ;fi

	#Moodle
	
	if test -f "moodle/config.php"; then echo "This is Moodle. I got nothin yet ¯\_(ツ)_/¯ " ;fi

	#Magento 
	
	if test -f "app/etc/env.php"; then echo "This is Magento. I got nothin yet ¯\_(ツ)_/¯ " ;fi

	#PHP
	
	if test -f "include/connect.php"; then echo "This is PHP. I got nothin yet ¯\_(ツ)_/¯ " ;fi

	#HTML
	
	if test -f "index.html"; then echo "This is HTML. I got nothin  ¯\_(ツ)_/¯ " ;fi
