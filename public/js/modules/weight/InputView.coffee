define (require, exports, module) ->
  Backbone = require 'backbone'

  Input = require "tpl!modules/weight/input.template"
  WeightModel = require "cs!modules/weight/WeightModel"

  class InputView extends Backbone.View

    id: 'input'
    className: 'row'

    events:
      'click #submit' : 'validate'
      'keypress #weightNumber' : 'updateOnEnter'

    render: ->
      $(@el).append(Input)
      @

    validate: ->
      @weight = $('#weightNumber')

      if(@weight.val() )
        @submit()
      else
        @error()

    submit: ->
      dates = @get_date()

      weightModel = new WeightModel

      weightModel.set
        dates: dates
        weight: @weight.val()

      @collection.add(weightModel)
      weightModel.save()

    get_date: ->
      currentTime = new Date()
      month = currentTime.getMonth() + 1
      day = currentTime.getDate()
      year = currentTime.getFullYear()

      date = day + "/" + month + "/" + year

    updateOnEnter: (e) ->
      @weight.removeClass('error') if(@reps)
      @validate()  if e.keyCode is 13

    error: ->
      if(!@weight.val())
        console.log 'error'
        @weight.addClass('error')
