helper = require './build_lib/helper'

# Options primarily for compiling
option '-s', '--source [FOLDER]', 'source folder of coffee files'

# lib folder is used throughout compiling and optimizing
option '-l', '--lib [FOLDER]', 'library compile target folder'

# Options for optimizing
option '-a', '--almond [FILE]', 'almond shim loader'
option '-o', '--out [FILE]', 'output file name'
option '-m', '--main_module [FILE]', 'output file name'

# Option to run a given test suite
option '-t', '--testsuite [FILE]', 'test loader file (e.g. index.html)'


task 'clean', 'Remove all files from target directory', (options) ->
  lib = options['lib'] || './lib'
  helper.clean(lib)


task 'build', 'Build lib/ from source pathes (e.g. ./src:./src2:./src3', (options) ->
  lib = options['lib'] || './lib'
  src = options['source'] || './src'

  helper.build src, lib, helper.removeRedundantFileEndings(lib)


task 'optimize', 'Optimizing application.js with r.js', (options) ->
  lib = options['lib'] || './lib'
  almond = options['almond']
  mainModule = options['main_module']
  output = options['out']
  helper.optimize(lib, almond, mainModule, output)


task 'test', 'executing qunit test suite', (options) ->
  testSuite = options['testsuite'] || './index.html'
  helper.run_qunit_tests(testSuite)


task 'all', 'Builds and optimizes the appliation js files', ->
  invoke 'clean'
  invoke 'build'
  invoke 'optimize'
  invoke 'test'

