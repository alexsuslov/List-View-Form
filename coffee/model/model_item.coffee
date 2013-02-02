##############################################
#
# Model
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################

packages = ['backbone']

define( packages , (BB)->
  Model = BB.Model.extend
    # Mongo style id 
    idAttribute: "_id"
    events:
      'error':'popup'
    popup:(err)->
      console.log err
    initialize: ->
      # @on 'error',(err)->
      #   console.log err
      #   msg_err = 'Error!  ' + err
      #   $.mobile.showPageLoadingMsg $.mobile.pageLoadErrorMessageTheme, msg_err, true 
      #   setTimeout $.mobile.hidePageLoadingMsg, 1500
      #   @
    validate: (attrs, options)->
      if !attrs.name
        'No Name?'
  Model)