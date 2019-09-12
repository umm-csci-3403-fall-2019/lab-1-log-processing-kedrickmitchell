#!/bin/bash

DIRNAME=$1

#call wrap contents; header and footer from the html_components section and using this data collected from the failed_login_data.txt.

#this file should count the number of occurences of failed login attempts by username, then create it into a file that contains javascript that has (data.addRow('Username', '# of occurences')) 
MAIN=$(pwd)
cd $DIRNAME

HERE=$(pwd)
touch temp.txt

cat failed_login_data.txt | awk 'match($0,/([a-zA-Z]+) ([0-9 ]+) ([a-zA-z0-9_]+) ([0-9.]+)/, groups) {print groups[3] }' < failed_login_data.txt > temp.txt | sort temp.txt | uniq -fc | awk 'match($0,/([0-9]+) ([a-zA-Z _]+)/, groups) {print data.addRow([\x27groups[2]\x27,groups[1]]);}' 

cd 
cd $MAIN

./ bin/wrap_contents.sh html_components/username_dist_header.html $HERE/temp.txt html_components/username_dist_footer.html





