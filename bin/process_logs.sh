#!/bin/bash

STARTDIR=$(pwd)

#cd "$STARTDIR"|| exit

#right now it is called like this
#./bin/process_logs.sh cscirepo_secure.tgz discovery_secure.tgz ganesha_secure.tgz mylar_secure.tgz velcro_secure.tgz zeus_secure.tgz

dir=$(mktemp --directory) # scratchdir

for i in "$@"
do
	name=$(basename "$i" .tgz)
	mkdir -p "$dir"/"$name"
	tar -xzf $i -C "$dir"/"$name"
	./bin/process_client_logs.sh "$dir"/"$name";
done

./bin/create_username_dist.sh "$dir"

./bin/create_hours_dist.sh "$dir"

./bin/create_country_dist.sh "$dir"

./bin/assemble_report.sh "$dir"

mv  "$dir"/failed_login_summary.html "$STARTDIR" 

rm -rf "$dir"
