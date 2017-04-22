#!/bin/bash

UNIXUSER=ncadmin
UNIXPASS=nextcloud

# Create $UNIXUSER if not existing
if id "$UNIXUSER" >/dev/null 2>&1
then
        echo "$UNIXUSER already exists!"
else
        sudo adduser --disabled-password --gecos "" $UNIXUSER
        echo -e "$UNIXUSER:$UNIXPASS" | sudo chpasswd
        sudo usermod -aG sudo $UNIXUSER
fi

if [ -d /home/$UNIXUSER ];
then
        echo "$UNIXUSER OK!"
        exit 0
else
        echo "Something went wrong when creating the user... Script will exit."
        exit 1
fi
