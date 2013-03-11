define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class WeightCollection extends Backbone.Collection
  	
  	url: "/json/weight/"