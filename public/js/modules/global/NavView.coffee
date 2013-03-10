define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "tpl!modules/global/nav.template"

  class NavView extends Backbone.View
    className: 'row'
    id: 'nav'

    events:
    	'click' : 'test'

    render: ->
    	$(@el).append(template)
    	@

   	test: (e) ->
   		Backbone.history.navigate "/", true