fs = require 'fs'
path = require 'path'

class FileWalker
  constructor: (@path, @callback) ->

  examine: (file) =>
    fs.stat file, (err, stats) =>
      if stats.isFile()
        @callback(file)
      else
        new FileWalker(file, @callback).readDir()

  examineDir: (err, files) =>
    @examine(path.join(@path, file)) for file in files

  readDir: =>
    fs.readdir(path.resolve(@path), @examineDir)

exports.filewalker = FileWalker
