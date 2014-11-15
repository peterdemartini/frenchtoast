'use strict';

var config   = require('./config'),
		requirer = require('./lib/requirer'),
		Hapi     = require('hapi');

// Create a server with a host and port
var server = new Hapi.Server(config.host, config.port);

// Require Hapi.js Config
requirer
	.getDirectoryFiles(__dirname + '/config/hapi', function(file){
		require(file)(server, config);
	});

// Require Routes
requirer
	.getDirectoryFiles(__dirname + '/app/routes', function(file){
		require(file)(server, config);
	});

// Start the server
server.start(function(){
	console.log(config.app.name + ' running at:', server.info.uri);
});