#!/bin/bash

STARTDIR=$(pwd)

cd log_files/
#right now it is called like this
#./bin/process_logs.sh cscirepo_secure.tgz discovery_secure.tgz ganesha_secure.tgz mylar_secure.tgz velcro_secure.tgz zeus_secure.tgz 
tar -xzf $1 $2 $3 $4 $5 $6
cd $STARTDIR

./bin/process_client_logs.sh log_files/

./bin/create_username_dist.sh log_files/

./bin/create_hours_dist.sh log_files/

./bin/create_country_dist.sh log_files/

./bin/assemble_report.sh log_files/
