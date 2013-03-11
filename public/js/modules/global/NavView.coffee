define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "tpl!modules/global/nav.template"

  class NavView extends Backbone.View
    className: 'row'
    id: 'nav'

    events:
      "click #home": "home"
      "click #weightBtn": "weight"

    render: ->
    	$(@el).append(template)
    	@

   	home: (e) ->
   		Backbone.history.navigate "/", true

    weight: (e) ->
      Backbone.history.navigate "/weight", true