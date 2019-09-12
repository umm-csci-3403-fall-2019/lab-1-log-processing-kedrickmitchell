#!/bin/bash

DIRNAME=$1

#call wrap contents; header and footer from the html_components section and using this data collected from the failed_login_data.txt.

#this file should count the number of occurences of failed login attempts by username, then create it into a file that contains javascript that has (data.addRow('Username', '# of occurences')) 
MAIN=$(pwd)
cd $DIRNAME

HERE=$(pwd)


cat */failed_login_data.txt | awk 'match($0, /([a-zA-Z]+) ([0-9]+) ([0-9]+) ([a-zA-z0-9_]+) ([0-9.]+)/, groups) {print groups[4]}' | sort | uniq -c | awk 'match($0, /[ ]+([0-9]+) ([a-zA-Z_0-9]+)/, groups) {print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);"}' > temp.html

cd $MAIN

./bin/wrap_contents.sh $HERE/temp.html $MAIN/html_components/username_dist $HERE/username_dist.html

rm $HERE/temp.html


