#!/usr/bin/env bash

set -e

setenv() {
    read -p "DB URI (\"$DB_URL\"): " var1
    export DB_URL=${var1:-$DB_URL}

    read -p "DB Username (\"$DB_USERNAME\"): " var1
    export DB_USERNAME=${var1:-$DB_USERNAME}
    
    read -sp "DB Password: " var1
    export DB_PASSWORD=${var1:-$DB_PASSWORD}

    echo
    echo "======================================================"
    echo "The script will run with the following db connection"
    echo "### db url:      $DB_URL"
    echo "### db schema:   $DB_USERNAME"
    read -p "To run type [y], to edit db information type [e], to quit leave blank? " confirm

    if [ "$confirm" == "e" ]; then 
        setenv;
    elif [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        exit 1;
    fi
}
setenv

export JAVA_OPTS="$JAVA_OPTS -Duser.timezone=GMT"

if [ $# -eq 0 ]; then
    # if no arguments are supplied start apache
    echo "Script available:"
    ls -l $CLI_HOME/scripts
    ls -l $CLI_SHARE_SCRIPT_HOME
    exit 1
fi

SCRIPT_FILE_NAME="scripts/$1"
if [ ! -f "$SCRIPT_FILE_NAME" ]; then
    SCRIPT_FILE_NAME=$CLI_SHARE_SCRIPT_HOME/$1
fi
shift
echo "Executing script $SCRIPT_FILE_NAME"
exec launch.sh $SCRIPT_FILE_NAME "$@"