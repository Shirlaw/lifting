define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class ExerciseModel extends Backbone.Model

  	url: '/json/home/'

  	parse: (resp,xhr) ->
  		@.set
	  		id: resp