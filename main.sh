#!/bin/bash
# made by tylern
#The purpose of this is to echo out the database credentials for any CMS and the instructions on how to do it correctly, instead of guessing at database/username combos, or potentially fat-fingering a sql command, everything is filled in. Copy and paste the raw file to get those functions started. #Joomla coming soon™ #Moodle coming soon™ #Drupal coming soon™


{
    clear

    PS3='Which CMS did we need to dump?'
    options=("Wordpress" "PrestaShop" "Joomla" "Moodle" "Drupal" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Wordpress")
(
	echo "This is Wordpress $(wp core version)"
	echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) is $(awk -F"'" '/DB_PASSWORD/{print $4}' wp-config.php)"
	echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' wp-config.php) $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php) > $(awk -F"'" '/DB_NAME/{print $4}' wp-config.php).$(whoami).$(date +%F).sql"
	find . -1t | head -1 | grep *.sql
)
                ;;
             "PrestaShop")
        	(
 		clear
		if test -f "config/settings.inc.php"; then (https://raw.githubusercontent.com/Risingfeanyx/Any_CMS_database_dump/master/Prestashop.sh);fi 
		echo "Password for $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) is $(awk -F"'" '/DB_PASSWD_/{print $4}' config/settings.inc.php)"
		echo "mysqldump -p -u $(awk -F"'" '/DB_USER/{print $4}' config/settings.inc.php) $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php) > $(awk -F"'" '/DB_NAME/{print $4}' config/settings.inc.php).$(whoami).$(date +%F).sql"
		ls -1t | head -1 | grep *.sql
        	)
				;;
           	"Joomla")
                #placeholder
                ;;
            "Drupal")
                #placeholder
                ;;
            "Moodle")
			#placeholder
                ;;
            "Quit")
                break
                ;;
            *) echo -e "invalid option $REPLY";;
        esac
    done
}
