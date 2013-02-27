fs = require 'fs'
{puts} = require 'sys'
{spawn} = require 'child_process'

helper =
  handleData: (provider, callback, provideExit) ->
    provider.stderr.on 'data', (data) ->
      puts data.toString()

    provider.stdout.on 'data', (data) ->
      puts data.toString()

    provider.on 'exit', (code) ->
      callback?() if code is 0
      process.exit code if provideExit?


  cleanupFilenames: ->
    # giving some output and delivering a callback,
    # to use it for example as build callback.
    #
    # @return [Function]
    # @example helper.cleanupFilenames()
    puts "-- cleaning redundant file endings from js.coffee files"
    (file) -> fs.rename file, (-> file.replace '.js.js', '.js')()


  build: (src, lib, callback) ->
    puts "compiling #{src} to #{lib}"
    coffee = spawn 'coffee', ['-c', '-o', lib, src]
    helper.handleData(coffee, callback)


  # Optimize the application.js with r.js
  # and use the almond AMD Shims.
  optimize: (baseUrl) ->
    node = spawn 'node', ['./vendor/r.js',
                          '-o',
                          'name=../vendor/almond',
                          'include=application',
                          'out=./lib/combined.js',
                          "baseUrl=#{baseUrl}",
                          'optimize=none',
                          'wrap=true']

    helper.handleData(node)



  run_qunit_tests: (test_suite) ->
    phantomjs = spawn 'phantomjs', ['vendor/phantomjs-qunit-runner.js', test_suite]
    helper.handleData(phantomjs, null, true)

module.exports = helper
