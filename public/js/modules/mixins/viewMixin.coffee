define (require, exports, module) ->
       
  Backbone = require 'backbone'
  
  viewMixin =
  
    leave: ->
      @unbindFromAll()
      @remove()
      
    bindTo: (source, event, callback) ->
      source.bind event, callback, this
      @bindings = @bindings or []
      @bindings.push
        source: source
        event: event
        callback: callback

    unbindFromAll: ->
      _.each @bindings, (binding) ->
        binding.source.unbind binding.event, binding.callback

      @bindings = []