module.exports = (server, config) =>
  server.route
    method: 'GET'
    path: '/healthcheck'
    handler: (request, reply) =>
      reply('site online')
