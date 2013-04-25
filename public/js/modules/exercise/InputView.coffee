define (require, exports, module) ->
  Backbone = require 'backbone'

  Input = require "text!modules/exercise/input.template"
  ExerciseModel = require "cs!modules/exercise/ExerciseModel"

  class InputView extends Backbone.View

    id: 'input'
    className: 'row'

    events:
      'click #submit' : 'validate'
      'keypress #repsInput' : 'updateOnEnter'
      'keypress #weightInput' : 'updateOnEnter'

    render: ->
      $(@el).append(Input)
      @

    validate: ->
      @reps = $('#repsInput')
      @weight = $('#weightInput')
      if( @reps.val() )
        @submit()
      else
        @error()

    submit: ->
      @reps.removeClass('error') if(@reps)
      @weight.removeClass('error') if(@reps)
      
      dates = @get_date()
      exerciseId = @options.exerciseId

      exerciseModel = new ExerciseModel
        exerciseId: exerciseId

      exerciseModel.set
        exerciseId: exerciseId
        dates: dates
        reps: @reps.val()
        weight: @weight.val()

      @collection.add(exerciseModel)
      exerciseModel.save()

    get_date: ->
      currentTime = new Date()
      month = currentTime.getMonth() + 1
      day = currentTime.getDate()
      year = currentTime.getFullYear()

      date = day + "/" + month + "/" + year

    updateOnEnter: (e) ->
      @validate()  if e.keyCode is 13

    error: ->
      if(!@reps.val())
        @reps.addClass('error')
      
      if(!@weight.val())
        @weight.addClass('error')