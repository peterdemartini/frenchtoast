_  = require 'lodash'
colors = require 'colors/safe'

config = 
  app: 
    name: 'FrechToast'
    description: 'An awesome full stack CoffeeScript boilerplate'
  sessionHash: 'ILIKEFRENCHTOAST'

env = {}
envFile = __dirname + '/env/' + process.env.NODE_ENV

try
  env = require envFile || env
catch
  console.error colors.red 'No environment config found'

module.exports = _.extend config, env