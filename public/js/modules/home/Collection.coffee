define (require, exports, module) ->
  Backbone = require 'backbone'
       
  class exerciesCollection extends Backbone.Collection
    url : '/exercises'