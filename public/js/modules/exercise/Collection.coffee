define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class exercieCollection extends Backbone.Collection
  	
  	initialize: (models, options) ->
  	  @id = options.id

  	url: ->
  	  "/json/exercise/"