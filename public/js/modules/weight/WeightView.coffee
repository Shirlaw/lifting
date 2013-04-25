define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  ConfirmView = require 'cs!modules/global/ConfirmView'
  template = require "text!modules/weight/weight.template"

  class WeightView extends Backbone.View

    template: _.template(template)
    tagName: 'li'

    events:
    	'click .delete' : 'delete'

    render: ->
      $(@el).append @template @model.toJSON()

    delete: (e) ->
      confirmView = new ConfirmView

      if(confirmView.response)
        @remove()
        @model.url = "/json/weight/" + @model.id
        @model.destroy()