define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  ExerciseModel = require "cs!modules/home/ExerciseModel"
  Input = require "tpl!modules/home/input.template"

  class ExerciseList extends Backbone.View

    id : 'input'

    events:
      'click #submit' : 'validate'
      'keypress #exerciseInput' : 'updateOnEnter'

    render: ->
      $(@el).append(Input)
      @

    validate: ->
      exercise = $('#exerciseInput')

      if(exercise.val())
        @addExcerise()
      else
        exercise.addClass('error')

    addExcerise: ->
      exercise = $('#exerciseInput')

      exerciseModel = new ExerciseModel

      exerciseModel.set
        'title' : exercise.val()

      exerciseModel.save
        success: ->
          console.log 'success'

      @collection.add(exerciseModel)
      exercise.val('')

    updateOnEnter: (e) ->
      @validate()  if e.keyCode is 13