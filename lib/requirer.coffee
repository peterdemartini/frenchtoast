fs = require 'fs'
_  = require 'lodash'


class Requirer
  getFile: (path, file, callback) =>
    filePath = path + '/' + file
    try
      stat = fs.statSync filePath
      if stat.isFile() && /(.*)\.(js$|coffee$)/.test file
        callback null, filePath
      else if stat.isDirectory()
        @getDirectoryFiles filePath, callback
      else
        callback new Error('Invalid File Type')
    catch error
      callback error

  getDirectoryFiles: (path, callback) =>
    fs.readdir path, (error, files) =>
      return callback error if error
      _.each files, (file) =>
        @getFile(path, file, callback)

module.exports = Requirer