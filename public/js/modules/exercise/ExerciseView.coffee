define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  NavView = require 'cs!modules/global/NavView'
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  HeaderView = require 'cs!modules/exercise/HeaderView'
  PreviousViews = require 'cs!modules/exercise/PreviousViews'
  InputView = require 'cs!modules/exercise/InputView'

  class ExerciseView extends Backbone.View

    render: ->

      headerView = new HeaderView
      headerView.render()

      previousViews = new PreviousViews
        collection : @collection
        
      inputView = new InputView
        collection : @collection
        exerciseId: @options.exerciseId
      inputView.render()

      navView = new NavView
      navView.render()

      $(@el).append headerView.el
      $(@el).append previousViews.el
      $(@el).append inputView.el
      $(@el).append(navView.el)