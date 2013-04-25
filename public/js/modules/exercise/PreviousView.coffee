define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "text!modules/exercise/previous.template"

  ConfirmView = require 'cs!modules/global/ConfirmView'

  class View extends Backbone.View

    template: _.template(template)
    tagName: 'li'
    className: 'row'

    events:
      'click .delete' : 'clicked'

    render: ->
      $(@el).append @template @model.toJSON()

    clicked: (e) ->
      confirmView = new ConfirmView

      if(confirmView.response)
        @remove()
        @model.url = "/json/exercise/" + @model.id
        @model.destroy()