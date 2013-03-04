helper = require './build_lib/helper'
{filewalker} = require './build_lib/filewalker'

option '-l', '--lib [FOLDER]', 'library compile target folder'
option '-s', '--source [FOLDER]', 'source folder of coffee files'
option '-t', '--testsuite [FILE]', 'test loader file (e.g. index.html)'
option '-a', '--almond [FILE]', 'almond shim loader'
option '-o', '--out [FILE]', 'output file name'
option '-m', '--main_module [FILE]', 'output file name'

task 'cleanup', 'Remove all files from target directory', ->

task 'build', 'Build lib/ from source pathes (e.g. ./src:./src2:./src3', (options) ->
  console.log '## BUILDING JS FILES FROM COFFEESCRIPT'
  lib = options['lib'] || './lib'
  src = options['source'] || './src'

  helper.build src, lib, (new filewalker(lib, helper.cleanupFilenames())).readDir

task 'optimize', 'Optimizing application.js with r.js', (options) ->
  console.log '## OPTIMIZING JS FILES WITH SHIM LOADER'
  lib = options['lib'] || './lib'
  almond = options['almond'] #|| './lib'
  mainModule = options['main_module']
  output = options['out']
  helper.optimize(lib, almond, mainModule, output)

task 'test', 'executing qunit test suite', (options) ->
  console.log '## EXECUTING TEST SUITE'
  testSuite = options['testsuite'] || './index.html'
  helper.run_qunit_tests(testSuite)

task 'all', 'Builds and optimizes the appliation js files', ->
  invoke 'build'
  invoke 'optimize'
  invoke 'test'

