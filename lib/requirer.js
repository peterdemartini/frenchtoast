var fs = require('fs'),
		_  = require('lodash');

var RequirerLib = {};

RequirerLib.getDirectoryFiles = function(path, requireFn){
	fs.readdir(path, function(error, files){
		if(error){
			console.error(error);
		}
		_.each(files, function(fileOrDir){
			var filePath = path + '/' + fileOrDir;
			var stat = fs.statSync(filePath);
			if(stat.isFile()){
				if (/(.*)\.(js$|coffee$)/.test(fileOrDir)) {
            requireFn(filePath);
        }
			}else if(stat.isDirectory()){
				RequirerLib.getDirectoryFiles(filePath);
			}
		});
	});
};

module.exports = RequirerLib;