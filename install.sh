#!/bin/sh
tar xzf /opencart-3.0.3.2.tgz 
php install/cli_install.php install \
		--db_hostname $DB_HOST \
		--db_username $DB_USER \
		--db_password $DB_PASSWORD \
		--db_database $DB_NAME \
		--db_driver mysqli \
		--username $ADMIN_USERNAME \
		--password $ADMIN_PASSWORD \
		--email $ADMIN_EMAIL \
		--http_server $PROTOCOL://$DOMAIN_NAME/

for c in config.php admin/config.php; do
	sed -i "s#/workdir#$DOCUMENT_ROOT#g" $c
        sed -i "s/define('HTTPS_SERVER', 'http/define('HTTPS_SERVER', 'https/" $c
        sed -i "s/define('HTTPS_CATALOG', 'http/define('HTTPS_CATALOG', 'https/" $c
done
