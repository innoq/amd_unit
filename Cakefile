helper = require './build_lib/helper'
{filewalker} = require './build_lib/filewalker'

task 'cleanup', 'Remove all files from target directory', ->

task 'build', 'Build lib/ from src/', ->
  helper.build './src', './lib', new filewalker('./lib', helper.cleanupFilenames).readDir

task 'optimize', 'Optimizing application.js with r.js', ->
  helper.optimize('./lib')

task 'test', 'executing qunit test suite', ->
  helper.run_qunit_tests('./index.html')

task 'all', 'Builds and optimizes the appliation js files', ->
  invoke 'build'
  invoke 'optimize'
  invoke 'test'

