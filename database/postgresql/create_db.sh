#!/bin/bash

DBNAME="db-name"
DBUSER="db-user"
DBPASS="db-password"

OS="$(uname -s)"

if [ $OS == "Darwin" ]; then # mac
    psql -d postgres --command "CREATE USER $DBUSER WITH SUPERUSER PASSWORD '$DBPASS';" && createdb -O $DBUSER $DBNAME
else # linux
sudo -u postgres bash << EOF
    psql --command "CREATE USER $DBUSER WITH SUPERUSER PASSWORD '$DBPASS';" && createdb -O $DBUSER $DBNAME
EOF
fi