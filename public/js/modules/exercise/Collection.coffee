define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class exercieCollection extends Backbone.Collection
  	
  	url: ->
  	  "/json/exercise/"