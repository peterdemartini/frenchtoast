module.exports = (server) =>
  options = 
    opsInterval: 1000
    reporters: [
      reporter: require 'good-console'
      args: [
        log: '*'
        request: '*'
      ]
    ]

  server.register
    register: require 'good'
    options: options
  , (error) =>
    console.error error if error?