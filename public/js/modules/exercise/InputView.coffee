define (require, exports, module) ->
  Backbone = require 'backbone'

  Input = require "tpl!modules/exercise/input.template"
  ExerciseModel = require "cs!modules/exercise/ExerciseModel"

  class InputView extends Backbone.View

    id: 'input'
    className: 'row'

    events:
      'click #submit' : 'validate'
      'keypress #reps' : 'updateOnEnter'
      'keypress #weight' : 'updateOnEnter'

    render: ->
      $(@el).append(Input)
      @

    validate: ->
      @reps = $('#reps')
      @weight = $('#weight')

      if( @reps.val() && @weight.val() )
        @submit()
      else
        @error()


    submit: ->
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
      @reps.removeClass('error')
      @weight.removeClass('error')
      @validate()  if e.keyCode is 13

    error: ->
      if(!@reps.val()) 
        $('#reps').addClass('error')
      
      if(!@weight.val())
        $('#weight').addClass('error')
