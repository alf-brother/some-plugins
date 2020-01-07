-- @author: r0fl
-- Creates the table to save the opening times of the files.
CREATE TABLE open 
(
  key         INTEGER PRIMARY KEY AUTOINCREMENT,
  date0       TEXT,
  timestamp0  INTEGER,
  name        TEXT
);
-- Creates the table to save the closing times of the files with a reference to
-- the open table
CREATE TABLE close
(
  key         INTEGER PRIMARY KEY AUTOINCREMENT,
  timestamp0  INTEGER,
  name        TEXT,
  okey        INTEGER,
  FOREIGN KEY (okey) REFERENCES open (key)
);
