fs = require 'fs'
path = require 'path'
{puts} = require 'sys'
{spawn} = require 'child_process'
{filewalker} = require './filewalker'

# @license [https://github.com/AvianFlu/ncp/blob/master/LICENSE.md] MIT
{ncp} = require 'ncp'
ncp.limit = 5;

helper =
  handleData: (provider, callback) ->
    provider.stderr.on 'data', (data) ->
      puts data.toString()

    provider.stdout.on 'data', (data) ->
      puts data.toString()

    provider.on 'exit', (code) ->
      callback?() if code is 0
      process.exit code unless code is 0



  cleanupFilenames: ->
    # giving some output and delivering a callback,
    # to use it for example as build callback.
    #
    # @return [Function]
    # @example helper.cleanupFilenames()
    (file) -> fs.rename file, (-> file.replace '.js.js', '.js')()


  removeFile: ->
    (file) -> fs.unlink file


  build: (src, lib, callback) ->
    puts "-- building files from #{src}"
    sources = helper.parseSourcePathes(src)

    for source in sources
      puts "compiling #{source} to #{lib}"
      coffee = spawn 'coffee', ['-c', '-o', lib, source]
      helper.handleData(coffee, callback)


  parseSourcePathes: (path) ->
    path = path.split(':')

  # Optimize the application.js with r.js
  # and use the almond AMD Shims.
  optimize: (baseUrl, almond, mainModule, output) ->
    node = spawn 'node', ['./vendor/r.js',
                          '-o',
                          "name=#{almond}",
                          "include=#{mainModule}",
                          "out=#{output}",
                          "baseUrl=#{baseUrl}",
                          'optimize=none',
                          'wrap=true']

    helper.handleData(node)

  removeRedundantFileEndings: (path) ->
    puts "-- cleaning redundant file endings from js.coffee files in #{path}"
    (new filewalker(path, helper.cleanupFilenames())).readDir

  clean: (path) ->
    puts "-- removing files from #{path}"
    (new filewalker(path, helper.removeFile())).readDir()

  run_qunit_tests: (test_suite) ->
    phantomjs = spawn 'mocha-phantomjs', [test_suite]
    helper.handleData(phantomjs, null)

  copy: (from, to) ->
    sources = helper.parseSourcePathes(from)
    for source in sources
      puts "-- copying dependencies from #{path.resolve(from)} to #{to}"
      base_name =  path.basename(source)
      ncp source, "#{to}/#{base_name}", (err) ->
        puts 'copiying the dependencies failed!' if err

module.exports = helper
