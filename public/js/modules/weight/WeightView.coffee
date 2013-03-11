define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  template = require "tpl!modules/weight/weight.template"

  class WeightView extends Backbone.View

    tagName: 'li'

    render: ->
      html = template this.model.toJSON()
      $(@el).append html