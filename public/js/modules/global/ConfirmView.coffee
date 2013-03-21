define (require, exports, module) ->
  Backbone = require 'backbone'

  class ConfirmView extends Backbone.View

    initialize:->
      @reponse
      response = confirm('Are you sure you want to delete')
      if(response)
        @response = response
      else
        @response = response