define (require, exports, module) ->

  Backbone = require 'backbone'
  ViewMixin = require 'cs!modules/mixins/viewMixin'
  
  PreviousView = require 'cs!modules/exercise/PreviousView'
  
  class Views extends Backbone.View

    tagName: 'ul'
    id: 'exercise'

    initialize: ->
      _.bindAll(this, 'renderItem', 'render','back')
      @collection.bind 'add', @renderItem
      @collection.bind 'reset', @render
    
    renderItem: (model) ->
      itemView = new PreviousView model: model
      itemView.render()
      $(@el).prepend itemView.el
      @

    render: ->
      this.collection.each this.renderItem
      

    back:(e) ->
      Backbone.history.navigate '/', true