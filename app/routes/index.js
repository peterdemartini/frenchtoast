'use strict';

module.exports = function(server, config) {
  server.route({
    method: 'GET',
    path: '/',
    handler: function(request, reply) {
      reply('Welcome to ' + config.app.name);
    }
  });
};