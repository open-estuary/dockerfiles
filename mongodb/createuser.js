print('Create Root Account ...');
db.createUser({user:"mongodb", pwd:"Estuary12#$", roles:[{role:"root", db:"admin"}]});
db.shutdownServer();
