#/bin/sh

# @author: r0fl
# With this script you get the hours and minutes spent modifying a file.
# You have to add the filename as paramenter.

filename=$1

stmt="SELECT dif/3600 AS h, (dif%3600)/60 AS m FROM (SELECT SUM(c.timestamp0-o.timestamp0) AS dif FROM close c JOIN open o ON (o.key = c.okey) WHERE o.name='$filename');"

echo $(sqlite3 -line ~/.time/time.db "$stmt")
