#!/bin/bash	

DIR=$1
HERE=$(pwd)

cd $DIR

touch temp.txt

#cat *.txt > temp.txt | sed -En 's/\* ([a-zA-Z0-9 ]+):\[[0-9]+\]:\[[0-9]+\] computer_name sshd \[[0-9]+\]: Failed password for (invalid user)? ([a-zA-z]) from ([0-9].+) port \[[0-9]+\] ssh2/\1 \2 \3/p' < temp.txt >> failed_login_data.txt

cat *.txt >> temp.txt | awk '{print $1} {print $2} {print $3} {print $11} {print $13}' temp.txt
