print('Create Root Account ...');
db.createUser({user:"mongodb", pwd:"Estuary12#$", roles:[{role:"userAdminAnyDatabase", db:"admin"}]});
db.shutdownServer();
