define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  ExerciseView = require 'cs!modules/home/ExerciseView' 

  class ExerciseList extends Backbone.View

    tagName: 'ul'
    className: 'row'
    id: 'exercises'
    
    initialize: ->
      _.bindAll(this, 'renderItem', 'render')
      @collection.bind 'reset', @render
      @collection.bind 'add', @renderItem
    
    renderItem: (model) ->
      itemView = new ExerciseView model: model
      itemView.render()
      $(@el).append itemView.el
      @

    render: ->
      this.collection.each this.renderItem