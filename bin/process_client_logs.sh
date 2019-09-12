#!/bin/bash     

DIR=$1

cd "$DIR" || exit

#cat var/log/* | sed -E -n 's/([a-zA-Z0-9 ]+):([0-9]+):([0-9]+) ([a-zA-Z_]+) sshd\[([0-9]+)\]: Failed password for (invalid user )? ([a-zA-z0-9]+) from ([0-9.]+) port ([0-9]+) ssh2/\1\7\8/p' > failed_login_data.txt

cat var/log/* | awk 'match($0, /([a-zA-Z0-9 ]+):([0-9]+):([0-9]+) ([a-zA-Z_]+) sshd\[([0-9]+)\]: Failed password for (invalid user )?([a-zA-z0-9]+) from ([0-9.]+) port ([0-9]+) ssh2/, groups) {print groups[1]" "groups[7]" "groups[8]}' > failed_login_data.txt
