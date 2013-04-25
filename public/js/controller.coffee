define (require, exports, module) ->
  Backbone = require 'backbone'

  #Home
  ExercisesCollection = require 'cs!modules/home/Collection'
  test = require 'text!modules/home/exercise.template'
  HomeView = require 'cs!modules/home/HomeView' 

  #Exercise
  PreviousCollection = require 'cs!modules/exercise/Collection'
  ExerciseView = require 'cs!modules/exercise/ExerciseView'

  WeightCollection = require 'cs!modules/weight/Collection'
  WeightView = require 'cs!modules/weight/Views'

  Collection = require 'cs!modules/test/Collection'

  #class definition
  class Controller extends Backbone.Router
    
    routes:
      '': 'home'
      "exercise/:id": "exercise"
      "weight" : "weight"
      '*path' : 'page404'

    initialize: ->
      @body = $('<div id="body"/>')
      @body.addClass('container')
      ($ 'body').append @body

      @collection = new Collection
      @exercisesCollection = new ExercisesCollection
      @weightCollection = new WeightCollection
      @testCollection = new WeightCollection

      @collection.exercisesCollection = @exercisesCollection
      @collection.weightCollection = @weightCollection
      @collection.testCollection = @testCollection

      @collection.fetch 
        success: (results) ->
          console.log 'sweeeeet'
    home: ->
      homeView = new HomeView
        collection : @exercisesCollection

      this.swap homeView
      $('body').html(@currentView.el)

    exercise: (id) ->
      pastId = parseFloat(id)

      @past = _(@testCollection.filter((model) ->

        return model.get('exercise_id') == pastId
      ))

      previousCollection = new PreviousCollection
      previousCollection.reset(@past._wrapped)

      console.log @past
      console.log @testCollection

      console.log previousCollection

      # previousCollection = new PreviousCollection([],
      #   id: id
      # )

      exerciseView = new ExerciseView
        collection : previousCollection
        exerciseId : id
     

      this.swap exerciseView
      $('body').html(@currentView.el)

    weight: ->
      weightView = new WeightView
        collection : @weightCollection

      this.swap weightView
      $('body').html(@currentView.el)


    page404: ->
      console.log '404 page'

    swap: (newView) ->
      @currentView.leave()  if @currentView and @currentView.leave
      @currentView = newView
      @currentView.render()
      $(@el).empty().append @currentView.el
      @