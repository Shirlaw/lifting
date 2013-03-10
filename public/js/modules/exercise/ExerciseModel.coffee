define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class ExerciseModel extends Backbone.Model

  	url: ->
  		'/json/exercise/' + @get('exerciseId')

  	parse: (resp,xhr) ->
  		@.set
	  		id: resp