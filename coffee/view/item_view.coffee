##############################################
#
# Item View
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################

packages = [
  "jquery"
  , "underscore"
  , "backbone"
  , "text!view/item_view.html"
]
define( packages , ( $, _, BB, Template)->
  Page = BB.View.extend
    initialize: ->
      @template = _.template Template
    render:()->
      @$el.html @template @model.toJSON()
      @
  Page)