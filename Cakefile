helper = require './build_lib/helper'
{filewalker} = require './build_lib/filewalker'


option '-l', '--lib [FOLDER]', 'library compile target folder'
option '-s', '--source [FOLDER]', 'source folder of coffee files'

task 'cleanup', 'Remove all files from target directory', ->

task 'build', 'Build lib/ from source pathes (e.g. ./src:./src2:./src3', (options) ->
  lib = options['lib'] || './lib'
  src = options['source'] || './src'

  helper.build src, lib, (new filewalker(lib, helper.cleanupFilenames())).readDir

task 'optimize', 'Optimizing application.js with r.js', (options)  ->
  console.log options
  lib = options['lib'] || './lib'
  helper.optimize(lib)

task 'test', 'executing qunit test suite', ->
  helper.run_qunit_tests('./index.html')

task 'all', 'Builds and optimizes the appliation js files', ->
  invoke 'build'
  invoke 'optimize'
  invoke 'test'

