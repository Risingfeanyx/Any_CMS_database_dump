	#!/bin/bash
	echo "This is Wordpress $(wp core version)"
	echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) is $(awk -F"'" '/DB_PASSWORD/{print $4}' wp-config.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' wp-config.php) $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) > $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php).$(whoami).$(date +%F).sql"
	ls -1t | head -1 | grep *.sql
