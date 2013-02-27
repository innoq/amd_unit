fs = require 'fs'
{print} = require 'sys'
{spawn} = require 'child_process'

helper =
  handleData: (provider, callback) ->
    provider.stderr.on 'data', (data) ->
      process.stderr.write data.toString()
    provider.stdout.on 'data', (data) ->
      print data.toString()
    provider.on 'exit', (code, err) ->
      callback?() if code is 0
      process.exit code


  cleanupFilenames: (file) ->
    fs.rename file, (->
      file.replace '.js.js', '.js')()

  build: (src, lib, callback) ->
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
    helper.handleData(phantomjs)

module.exports = helper
