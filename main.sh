	{
	clear
	#WORDPRESS
	echo "Password is $(awk -F"'" '/DB_PASSWORD/{print $4}' wp-config.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' wp-config.php) $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) > $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php).$(whoami).$(date +%F).sql"
	mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' wp-config.php) $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) > $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php).$(whoami).$(date +%F).sql
	echo *.sql
	ls -1t | head -1 | grep *.sql
	}


	#Prestashop 1.6 - 
	cat config.php/settings.inc.php | grep 'dbname\|username\|password'
	#Prestashop 1.7
	cat app/config.php/parameters.php | grep 'dbname\|username\|password'
	#Drupal 
	cat sites/default/settings.php |grep 'dbname\|username\|password'
	#Moodle 
	cat config.php.php | grep 'dbname\|username\|password' 
	#Magento 
	cat app/etc/env.php | grep 'dbname\|username\|password'
	#PHP
	cat include/connect.php | grep DATABASE
