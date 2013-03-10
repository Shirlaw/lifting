define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  NavView = require 'cs!modules/global/NavView'
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  #View files
  ExerciseView = require 'cs!modules/home/ExerciseList'
  InputView = require 'cs!modules/home/InputView'


  class HomeView extends Backbone.View
    
    initialize: ->

    render: ->
      exerciseView = new ExerciseView
        collection : @collection
      exerciseView.render()

      inputView = new InputView
        collection : @collection
      inputView.render()
      
      navView = new NavView
      navView.render()
      
      $(@el).append(exerciseView.el)
      $(@el).append(inputView.el)
      $(@el).append(navView.el)