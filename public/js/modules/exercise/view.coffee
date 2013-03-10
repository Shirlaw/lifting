define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "tpl!modules/exercise/previous.template"

  class View extends Backbone.View

    tagName: 'li'
    className: 'row'

    events:
      'click .delete' : 'clicked'

    render: ->
      html = template this.model.toJSON()
      $(@el).append html

    clicked: (e) ->
      @remove()
      @model.url = "/json/exercise/" + @model.id
      @model.destroy()