define (require, exports, module) ->
  Backbone = require 'backbone'

  #Home
  ExercisesCollection = require 'cs!modules/home/Collection'
  HomeView = require 'cs!modules/home/HomeView' 

  #Exercise
  PreviousCollection = require 'cs!modules/exercise/Collection'
  ExerciseView = require 'cs!modules/exercise/ExerciseView'

  #class definition
  class Controller extends Backbone.Router
    
    routes:
      '': 'home'
      "exercise/:id": "exercise"
      '*path' : 'page404'

    initialize: ->
      @body = $('<div id="body"/>')
      @body.addClass('container')
      ($ 'body').append @body
      @exercisesCollection = new ExercisesCollection

    home: ->

      homeView = new HomeView
        collection : @exercisesCollection

      console.log @exercisesCollection
      
      collectionLength = @exercisesCollection.length
      if(collectionLength == 0)
        @exercisesCollection.fetch()

      this.swap homeView
      $('body').html(@currentView.el)

    exercise: (id) ->
      previousCollection = new PreviousCollection([],
        id: id
      )

      exerciseView = new ExerciseView
        collection : previousCollection
        exerciseId : id
      previousCollection.url = previousCollection.url() + id

      collectionLength = previousCollection.length
      console.log collectionLength
      if(collectionLength == 0)
        previousCollection.fetch()

      this.swap exerciseView
      $('body').html(@currentView.el)

    page404: ->
      console.log '404 page'

    swap: (newView) ->
      @currentView.leave()  if @currentView and @currentView.leave
      @currentView = newView
      @currentView.render()
      $(@el).empty().append @currentView.el
      @