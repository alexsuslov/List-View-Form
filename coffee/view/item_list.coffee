##############################################
#
# List
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################

packages = [
  "jquery"
  , "underscore"
  , "backbone"
  , "js/item_row"
  ]

define packages , ( $, _, BB, Row)->
  List = BB.View.extend
    render:()->
      @$el.empty()
      @$el.attr('data-role', 'listview')
      @$el.attr('data-theme','c')
      @$el.attr('data-autodividers',"true")
      @$el.attr('data-filter',"true")
      @$el.attr('data-inset',"true")
      row = (item)->
        @el.appendChild new Row(model:item).render().el
      @collection.forEach row, @
  List