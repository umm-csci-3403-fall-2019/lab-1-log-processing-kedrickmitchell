#!/bin/bash	

DIR=$1

cd $DIR

cat *.txt |

#	sed -E 's/\* ([a-zA-Z0-9]):\[0-9]+\]:\[0-9]+\] computer_name sshd \[[0-9]+\]: Failed password for invalid user ([a-zA-z]) from ([0-9].+) port \[[0-9]+\] ssh2/\1 \2 \3/' <  > failed_login_data.txt


