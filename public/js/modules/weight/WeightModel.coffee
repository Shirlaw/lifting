define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class WeightModel extends Backbone.Model

  	url: '/json/weight/'

  	parse: (resp,xhr) ->
  		@.set
	  		id: resp