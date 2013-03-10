define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "tpl!modules/home/exercise.template"

  class View extends Backbone.View

    tagName: 'li'
    className: 'twelve columns'

    events:
      'click .title' : 'goToExercise'
      'click .delete' : 'deleteExercise'

    render: ->
      html = template this.model.toJSON()
      $(@el).append html

    goToExercise: (e) ->
      Backbone.history.navigate "exercise/" + @model.id, true

    deleteExercise: ->
      @remove()
      @model.url = "/json/home/" + @model.id
      @model.destroy()