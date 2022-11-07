SQLite3
http://www.pantz.org/software/sqlite/sqlite_commands_and_general_usage.html
http://linuxcommand.org/man_pages/sqlite31.html
 
sudo apt-get install sqlite3 libsqlite3-dev
 
touch test.db
sqlite3 test.db
create table test (ids integer primary key, value text);
create view testview AS select * from test;
.tables

.indices
.schema
.databases
.show 
insert into test (value) values('value1'); 
.mode column 	// queries will return nicely formatted columns (as text)
.headers on  	// queries will show headers
select * from test
.output /tmp/test.sql
.dump
.output stdout
.quit
cat /tmp/test.sql
