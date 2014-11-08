module.exports = function(server){
	server.route({
	    method: 'GET',
	    path: '/hello',
	    handler: function (request, reply) {

	        reply('hello world');
	    }
	});
};