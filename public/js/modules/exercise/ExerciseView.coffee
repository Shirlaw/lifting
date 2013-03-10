define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  NavView = require 'cs!modules/global/NavView'
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  HeaderView = require 'cs!modules/exercise/HeaderView'
  PreviousView = require 'cs!modules/exercise/Previous'
  InputView = require 'cs!modules/exercise/InputView'

  class ExerciseView extends Backbone.View

    render: ->

      headerView = new HeaderView
      headerView.render()

      previousView = new PreviousView
        collection : @collection
        
      inputView = new InputView
        collection : @collection
        exerciseId: @options.exerciseId
      inputView.render()

      navView = new NavView
      navView.render()

      $(@el).append headerView.el
      $(@el).append previousView.el
      $(@el).append inputView.el
      $(@el).append(navView.el)