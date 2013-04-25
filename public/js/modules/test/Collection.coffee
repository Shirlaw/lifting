define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class AllCollection extends Backbone.Collection
  	
  	url: "/json/all/"

  	parse: (data) ->
      @exercisesCollection.add(data.exercises)
      @weightCollection.add(data.weight)
      @testCollection.add(data.previous)