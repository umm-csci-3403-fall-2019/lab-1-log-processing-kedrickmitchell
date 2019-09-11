#!/bin/bash

DIRNAME=$1

#call wrap contents; header and footer from the html_components section and using this data collected from the failed_login_data.txt.

#this file should count the number of occurences of failed login attempts by username, then create it into a file that contains javascript that has (data.addRow('Username', '# of occurences')) 

cd $DIRNAME

cat failed_login_data.txt | awk ' { print $4 }' failed_login_data.txt | uniq -fci





