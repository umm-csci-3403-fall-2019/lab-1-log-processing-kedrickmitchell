#!/bin/bash	

DIR=$1

cd $DIR

cat var/log/* | sed -En 's/([a-zA-Z0-9 ]+):\[[0-9]+\]:\[[0-9]+\] computer_name sshd\[[0-9]+\]: Failed password for (invalid user)? ([a-zA-z0-9]+) from ([0-9.]+) port \[[0-9]+\] ssh2/\1 \3 \4/p' > failed_login_data.txt

