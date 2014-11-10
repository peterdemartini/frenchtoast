var _  = require('lodash'),
		fs = require('fs');

// Config
var config = {
	app : {
		name : 'Startler App',
		description : 'Do Awesome Things'
	},
	rootDir : __dirname + '/..',
	sessionHash : 'ILIKECH33S3BURGERS'
};

// Get Environment Config
var env = {},
		envFile = __dirname + '/' + process.env.NODE_ENV,
		envFileExits = fs.existsSync(envFile);

if(envFileExits){
	env = require(envFile) || env;
}

_.extend(config, env);

module.exports = config;