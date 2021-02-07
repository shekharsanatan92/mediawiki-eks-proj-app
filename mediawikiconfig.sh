#!/bin/bash

set -e

# Some defaults
: ${MEDIAWIKI_SITE_SERVER:=http://localhost:8080}
: ${MEDIAWIKI_SITE_NAME:=Hello}
: ${MEDIAWIKI_SITE_LANG:=en}
: ${MEDIAWIKI_ADMIN_USER:=wiki}
: ${MEDIAWIKI_ADMIN_PASS:=mediawiki123456}
: ${MEDIAWIKI_DB_NAME:=wikidatabase}
: ${MEDIAWIKI_DB_TYPE:=mysql}
: ${MEDIAWIKI_DB_PORT:=3306}
: ${MEDIAWIKI_DB_SCHEMA:=wikidatabase}
: ${MEDIAWIKI_DB_HOST:=wikidatabase.cnbvr1aru5et.us-east-1.rds.amazonaws.com}
: ${MEDIAWIKI_DB_USER:=wiki}
: ${MEDIAWIKI_DB_PASSWORD:=mediawiki}
: ${MEDIAWIKI_UPDATE:=false}
: ${MEDIAWIKI_RESTBASE_URL:=restbase-is-not-specified}


# Generate LocalSettings.php
php /var/www/html/maintenance/install.php \
	--confpath /var/www/html/ \
	--dbname "$MEDIAWIKI_DB_NAME" \
	--dbschema "$MEDIAWIKI_DB_SCHEMA" \
	--dbport "$MEDIAWIKI_DB_PORT" \
	--dbserver "$MEDIAWIKI_DB_HOST" \
	--dbtype "$MEDIAWIKI_DB_TYPE" \
	--dbuser "$MEDIAWIKI_DB_USER" \
	--dbpass "$MEDIAWIKI_DB_PASSWORD" \
	--installdbuser "$MEDIAWIKI_DB_USER" \
	--installdbpass "$MEDIAWIKI_DB_PASSWORD" \
	--server "$MEDIAWIKI_SITE_SERVER" \
	--scriptpath "" \
	--lang "$MEDIAWIKI_SITE_LANG" \
	--pass "$MEDIAWIKI_ADMIN_PASS" \
	"$MEDIAWIKI_SITE_NAME" \
	"$MEDIAWIKI_ADMIN_USER"

exec "$@"
