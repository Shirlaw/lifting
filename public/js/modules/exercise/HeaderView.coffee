define (require, exports, module) ->
  Backbone = require 'backbone'

  header = require "text!modules/exercise/header.template"

  class HeaderView extends Backbone.View
  	
    className: 'row'
    id: 'header'

    render: ->
	    $(@el).append header