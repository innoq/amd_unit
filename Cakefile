helper = require './build_lib/helper'

# Options primarily for compiling
option '-s', '--source [FOLDER]', 'source folder of coffee files (multiple folder possible, devided by colon)'
option '-d', '--dependencies [FOLDER]', 'multiple file pathes seperated by colon (relative to amd_unit folder)'

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


task 'optimize', 'Optimizing application.js with r.js', (options) ->
  lib = options['lib'] || './lib'
  almond = options['almond']
  mainModule = options['main_module']
  output = options['out']
  helper.optimize(lib, almond, mainModule, output)


task 'copy_dependencies', (options) ->
  dependencies = options['dependencies']
  lib = options['lib'] || './lib'
  helper.copy(dependencies, lib)


task 'build', 'Build lib/ from source pathes (e.g. ./src:./src2:./src3', (options) ->
  invoke 'clean'
  lib = options['lib'] || './lib'
  src = options['source'] || './src'

  helper.build src, lib, helper.removeRedundantFileEndings(lib)

  setTimeout (-> invoke 'copy_dependencies'), 1000



task 'test', 'executing qunit test suite', (options) ->
  testSuite = options['testsuite'] || './index.html'
  helper.run_qunit_tests(testSuite)


task 'all', 'Builds and optimizes the appliation js files', ->
  invoke 'build'
  setTimeout (-> invoke 'optimize'), 3000
  setTimeout (-> invoke 'test'), 4000

