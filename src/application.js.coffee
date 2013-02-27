require ['modules/logger'], (Logger) ->
  Logger.setConsole(console)
  Logger.info 'BUILD TEST'