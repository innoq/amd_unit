define ->
  class Logger
    @delimiter: '::'

    # set console object
    @setConsole: (@console) ->
      this

    # takes an array of messages and logs them,
    # if the console is available.
    # @param [Array] of Objects, like console.log
    @log: (messages) ->
      @console.log.call(@console, messages...) if @console? && @console.log?

    # provides prefixed log with INFO Flag
    #
    # @param [Array] of Objects, like console.log
    @info: (args...) ->
      args.unshift "INFO #{@delimiter}"
      @log(args)
