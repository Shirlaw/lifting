define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  ConfirmView = require 'cs!modules/global/ConfirmView'
  template = require "tpl!modules/weight/weight.template"

  class WeightView extends Backbone.View

    tagName: 'li'

    events:
    	'click .delete' : 'delete'

    render: ->
      html = template this.model.toJSON()
      $(@el).append html

    delete: (e) ->
      confirmView = new ConfirmView

      if(confirmView.response)
        @remove()
        @model.url = "/json/weight/" + @model.id
        @model.destroy()