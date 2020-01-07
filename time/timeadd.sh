#/bin/sh
# @author : r0fl
# This scripts adds on the opening event of a file its name and a timestamp to
# the open table in the database.


day=$(date '+%Y-%m-%d')
timestamp=$(date '+%s')
name=$1

stat="INSERT INTO open (date0, timestamp0, name) VALUES ('$day', $timestamp, '$name');"

sqlite3 -line ~/.time/time.db "$stat"
