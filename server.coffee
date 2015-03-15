'use strict';

path     = require 'path'
config   = require './config'
Requirer = require './lib/requirer'
Hapi     = require 'hapi'
colors   = require 'colors/safe'

server = new Hapi.Server

server.connection 
  host: config.host
  port: config.port
  
requirer = new Requirer
requirer.getDirectoryFiles __dirname + '/config/hapi', (error, file) =>
  return console.error error if error?
  require(file)(server, config)

requirer.getDirectoryFiles __dirname + '/app/routes', (error, file) =>
  return console.error error if error?
  require(file)(server, config)

server.start =>
  console.log "#{colors.green(config.app.name)} running at: #{colors.cyan(server.info.uri)}"