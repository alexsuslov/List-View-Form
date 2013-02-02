##############################################
#
# Page list
# Version 0.0.1
# 2012-01-28 Alex Suslov
#
##############################################
packages = [
  "jquery"
  , "underscore"
  , "backbone"
  ,'js/item_list'
  , "text!view/item_list.html"
]
define( packages , ( $, _, BB, List, Template)->
  Page = BB.View.extend
    initialize: ->
      @template = _.template Template
    render:()->
      @$el.html @template
      @listView = new List
        collection:@collection
        el: $("ul", @el)
      @listView.render()
      @
  Page)