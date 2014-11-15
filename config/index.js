'use strict';

var _  = require('lodash'),
		fs = require('fs');

// Config
var config = {
	app : {
		name : 'FrenchToast',
		description : 'Do Awesome Things'
	},
	sessionHash : 'ILIKECH33S3BURGERS'
};

// Get Environment Config
var env = {},
		envFile = __dirname + '/env/' + process.env.NODE_ENV,
		envFileExits = fs.existsSync(envFile);

if(envFileExits){
	env = require(envFile) || env;
}

_.extend(config, env);

module.exports = config;