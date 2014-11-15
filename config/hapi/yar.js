'use strict';

var config = require('../');

module.exports = function(server){
	var options = {
	    cookieOptions: {
	        password: config.sessionHash
	    }
	};

	server.pack.register({
	    plugin: require('yar'),
	    options: options
	}, function (error) {
		if(error){
			console.error(error);
		}
	});

};