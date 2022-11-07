MONGODB
Install/RUN

ARM 
https://github.com/Barryrowe/mongo-arm

debian
apt-get install mongodb
mkdir /root/mymongo
mongod --dbpath /root/mymongo/
http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/ how to update 
nano /etc/mongodb.conf
systemctl start mongodb.service
cat /var/log/mongodb/mongodb.log 

ARCH
systemctl start mongodb.service

mongod --version
mongo; by default the latest debian only installs 2.0.6 but the version is 2.6.6
http://stackoverflow.com/questions/19405791/what-version-of-mongodb-is-installed-on-ubuntu

GUI
robomongo
http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/
http://cwbuecheler.com/web/tutorials/2014/restful-web-app-node-express-mongodb/
http://jsfiddle.net/cwbuecheler/7fars/  stateless programming demo
http://mongodb.github.io/node-mongodb-native/markdown-docs/queries.html
http://mongoosejs.com/ mongo.db validation


mongo
use nodetest1
db.usercollection.insert({ "username" : "testuser1", "email" : "testuser1@testdomain.com" })
db.usercollection.find().pretty()    (pretty does linebreaks)

// insert ARRAY of objects
newstuff = [{ "username" : "testuser2", "email" : "testuser2@testdomain.com" }, { "username" : "testuser3", "email" : "testuser3@testdomain.com" }]
db.usercollection.insert(newstuff);
db.bios.remove( { } )
db.fotos.aggregate( [ {$group:{_id:"$name", num:{$sum:1}}}])
this query is working in mongo shell; but it needs version 2.6.6. and not 2.0.6



