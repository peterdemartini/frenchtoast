module.exports = (server, config) =>
  server.route
    method: 'GET'
    path: '/{param*}'
    handler:
      directory:
        path: 'public'
        listing: false
