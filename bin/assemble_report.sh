#!/bin/bash

dirname=$1

main=$(pwd)

cd "$dirname" || exit

here=$(pwd)

cat country_dist.html hours_dist.html username_dist.html > temp.html

cd "$main" || exit 

./bin/wrap_contents.sh "$here"/temp.html "$main"/html_components/summary_plots "$here"/failed_login_summary.html

rm "$here/temp.html"




