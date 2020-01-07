#/bin/sh
# @author : r0fl
# script to be executed if a file closes.
# It looks in the database for the entry with the smallest time difference and
# adds the primary key as forign key to the entry in the close table.

day=$(date '+%Y-%m-%d')
timestamp=$(date '+%s')
name=$1

# Select on the open table to get the entry with the smallest time difference.
stat="select key from open where name = '$name' and abs(timestamp0-$timestamp) = (select min(abs(timestamp0-$timestamp)) from open where name = '$name')";

# execution of the statement on the database.
key=$(sqlite3 -line ~/.time/time.db "$stat")
key=$(echo $key | cut -d" " -f3)

# Insert statement for the closing time.
stat="INSERT INTO close (timestamp0, name, okey) VALUES ($timestamp, '$name', $key);"
sqlite3 -line ~/.time/time.db "$stat"
