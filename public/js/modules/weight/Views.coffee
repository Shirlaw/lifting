define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'
  NavView = require 'cs!modules/global/NavView'

  WeightViews = require 'cs!modules/weight/WeightViews'
  HeaderView = require 'cs!modules/weight/HeaderView'
  InputView = require 'cs!modules/weight/InputView'

  class WeightView extends Backbone.View
    
    render: ->
      headerView = new HeaderView
      headerView.render()

      weightViews = new WeightViews
        collection : @collection
      weightViews.render()

      inputView = new InputView
        collection : @collection
      inputView.render()
      
      navView = new NavView
      navView.render()
      
      $(@el).append(headerView.el)
      $(@el).append(weightViews.el)
      $(@el).append(inputView.el)
      $(@el).append(navView.el)