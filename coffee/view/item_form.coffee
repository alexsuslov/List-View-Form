##############################################
#
# Item Form
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################

packages = [
  "jquery"
  , "jqm"
  , "underscore"
  , "backbone"
  , "js/model_item"
  , "text!view/item_form.html"
]
define( packages , ( $, jqm, _, BB, Model, Template)->
  Page = BB.View.extend
    initialize: (@opt)->
      @template = _.template Template
      unless @model
        @addnew = true
        @model = new Model()
      @model.on 'error',(model, err)->
        msg_err = 'Error!  ' + err
        $.mobile.showPageLoadingMsg $.mobile.pageLoadErrorMessageTheme, msg_err, true 
        setTimeout $.mobile.hidePageLoadingMsg, 1500
        @
    render:()->
      data = @model.toJSON()

      if @opt.urlBack
        data.urlBack = @opt.urlBack
      else
        data.urlBack = '#view/' + data._id

      if @opt.urlSave
        data.urlSave = @opt.urlSave
      else
       data.urlSave = '#view/' + data._id

      @$el.html @template data
      @
    events:
      'keyup input': 'input_change'
      'keyup textarea': 'input_change'
      "click a#btnUpd" : "add_update"
      'keyup a#btnDel': 'input_change'
    input_change:(e)->
      input = $(e.currentTarget)
      @model.set input.attr('name'), input.val()
      @
    add_update:()->
      unless @addnew
        @model._id = @collection.length
        @collection.add @model
      else
        @model.save()
      # @view()
      @
    del:()->
      @model.remove()
      # @view()
      @
  Page)