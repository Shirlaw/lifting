define (require, exports, module) ->

  Backbone = require 'backbone'
  ViewMixin = require 'cs!modules/mixins/viewMixin'
  
  View = require 'cs!modules/exercise/view'
  
  class Views extends Backbone.View

    tagName: 'ul'
    id: 'exercise'

    initialize: ->
      _.bindAll(this, 'renderItem', 'render','back')
      @collection.bind 'add', @renderItem
      @collection.bind 'reset', @render
    
    renderItem: (model) ->
      itemView = new View model: model
      itemView.render()
      $(@el).prepend itemView.el
      @

    render: ->
      this.collection.each this.renderItem
      

    back:(e) ->
      Backbone.history.navigate '/', true