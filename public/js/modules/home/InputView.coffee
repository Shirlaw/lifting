define (require, exports, module) ->
  Backbone = require 'backbone'

  #Global
  ViewMixin = require 'cs!modules/mixins/viewMixin'

  ExerciseModel = require "cs!modules/home/ExerciseModel"
  Input = require "text!modules/home/input.template"

  class ExerciseList extends Backbone.View

    id : 'input'
    className : 'row'

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

      title = exercise.val()
      title = title.slice(0, 1).toUpperCase() + title.slice(1)

      exerciseModel = new ExerciseModel

      exerciseModel.set
        'title' : title

      exerciseModel.save()

      @collection.add(exerciseModel)
      exercise.val('')

    updateOnEnter: (e) ->
      $('#exerciseInput').removeClass('error')
      @validate()  if e.keyCode is 13