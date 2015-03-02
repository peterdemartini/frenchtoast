fs = require 'fs'
_  = require 'lodash'


class Requirer
  getDirectoryFiles: (path, callback) =>
    fs.readdir path, (error, files) =>
      return callback error if error
      _.each files, (fileOrDir) =>
        filePath = path + '/' + fileOrDir
        stat = fs.statSync filePath
        if stat.isFile() && /(.*)\.(js$|coffee$)/.test fileOrDir
          callback null, filePath
        else if stat.isDirectory()
          @getDirectoryFiles filePath

module.exports = new Requirer