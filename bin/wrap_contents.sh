#!/bin/bash


CONT=$1
HEADER=$2_header.html
FOOTER=$2_footer.html
RES_FILE=$3

cat $HEADER $CONT $FOOTER > $RES_FILE


