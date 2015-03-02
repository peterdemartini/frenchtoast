module.exports = (server, config) =>
  server.route
    method: 'GET'
    path: '/'
    handler: (request, response) =>
      response "Welcome to #{config.app.name}"