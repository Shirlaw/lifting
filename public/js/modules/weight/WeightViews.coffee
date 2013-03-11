define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  WeightView = require 'cs!modules/weight/WeightView'

  class WeightViews extends Backbone.View

    tagName: 'ul'
    className: 'row'
    id: 'weight'

    initialize: ->
      _.bindAll(this, 'renderItem', 'render')
      @collection.bind 'reset', @render
      @collection.bind 'add', @renderItem

    renderItem: (model) ->
      weightView = new WeightView model: model
      weightView.render()
      $(@el).append weightView.el
      @

    render: ->
      @collection.each this.renderItem