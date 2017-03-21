#!/usr/bin/env bash

set -e

if [ -z $DB_URL ]; then
    read -p "DB Uri: " var1
    export DB_URL=$var1
fi

if [ -z $DB_USERNAME ]; then
    read -p "DB Username: " var1
    export DB_USERNAME=$var1
fi

if [ -z $DB_PASSWORD ]; then
    read -sp "DB Password: " var1
    export DB_PASSWORD=$var1
fi

echo
echo "======================================================"
echo "DB Information:"
echo "URL: $DB_URL"
echo "SCHEMA: $DB_USERNAME"
read -p "Keep executing the script (실행 계속하시갰습니까)? [n/y]" confirm

if [ "$confirm" != "y" ]; then exit 1; fi

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