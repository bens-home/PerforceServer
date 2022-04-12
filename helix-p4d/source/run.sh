#!/bin/bash

# Some colors for the terminal :)
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[1;33m'
NoColor='\033[0m' # No Color

# A simple flag to check if this is the first run of this container or not
INIT_DONE="CONTAINER_ALREADY_INITIALIZED"

if [ ! -e $INIT_DONE ]; then
    touch $INIT_DONE
    
    printf "${Yellow}Container starts for the first time, initializing...${NoColor}"
    /opt/perforce/sbin/configure-helix-p4d.sh perforce -n -p ${P4PORT} -r ${P4ROOT} -u ${P4USER}  -P ${P4PASSWD}  --unicode
else
    p4dctl start -t p4d perforce
    printf "${Green}Container started!${NoColor}"
fi