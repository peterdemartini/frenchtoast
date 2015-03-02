module.exports = (server, config) =>
  options = 
    cookieOptions:
      password: config.sessionHash

  server.register
    register: require 'yar'
    options: options
  , (error) =>
    console.error error if error?