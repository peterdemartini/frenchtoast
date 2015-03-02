'use strict';

config   = require './config'
requirer = require './lib/requirer'
Hapi     = require 'hapi'
colors   = require 'colors/safe'

server = new Hapi.Server config.host, config.port

requirer.getDirectoryFiles __dirname + '/config/hapi', (file) =>
  require(file)(server, config)

requirer.getDirectoryFiles __dirname + '/app/routes', (file) =>
  require(file)(server, config)

server.start =>
  console.log "#{colors.green(config.app.name)} running at: #{colors.cyan(server.info.uri)}"