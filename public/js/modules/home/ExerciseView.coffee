define (require, exports, module) ->
  Backbone = require 'backbone'

  template = require "text!modules/home/exercise.template"

  ConfirmView = require 'cs!modules/global/ConfirmView'

  class View extends Backbone.View

    template: _.template(template)
    tagName: 'li'
    className: 'twelve columns'

    events:
      'click .title' : 'goToExercise'
      'click .delete' : 'deleteExercise'

    render: ->
      $(@el).append @template @model.toJSON()
      @
      #html = this.template this.model.toJSON()
      #$(@el).append html

    goToExercise: (e) ->
      Backbone.history.navigate "exercise/" + @model.id, true

    deleteExercise: ->
      confirmView = new ConfirmView

      if(confirmView.response)
        @remove()
        @model.url = "/json/home/" + @model.id
        @model.destroy()