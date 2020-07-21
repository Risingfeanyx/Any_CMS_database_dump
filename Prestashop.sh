!#/bin/bash
  clear
	if test -f "config/settings.inc.php"; then (https://raw.githubusercontent.com/Risingfeanyx/Any_CMS_database_dump/master/Prestashop.sh);fi 
	echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) is $(awk -F"'" '/DB_PASSWD_/{print $4}' config/settings.inc.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' config/settings.inc.php) $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) > $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php).$(whoami).$(date +%F).sql"
	ls -1t | head -1 | grep *.sql
