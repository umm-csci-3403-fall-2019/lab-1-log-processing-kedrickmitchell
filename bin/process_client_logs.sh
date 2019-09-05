#!/bin/bash	

DIR=$1

sed -E 's/\* ([a-zA-Z0-9]):00:00 computer_name sshd [xxxxx]: Failed password fo invalid user ([a-zA-z]) from ([0-9].+) port 0000 ssh2//' 
