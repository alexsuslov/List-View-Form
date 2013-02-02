##############################################
#
# Item Router
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################
items = [
  {"_id":1, name:'test1'}
  , {"_id":2, name:'test2'}
  , {"_id":3, name:'test3'}
  , {"_id":4, name:'test4'}
  , {"_id":5, name:'test5'}
]

packages = [
  "jquery"
  , "backbone"
  ,'js/collection_item'
  ,'js/model_item'
  ,'js/index'
  ,'js/page'
  ,'js/item_view'
  ,'js/item_form'
]

define packages , ($,  BB, Collection, Model, Home, Page, View, Form) ->
  Router = BB.Router.extend
    routes:
      "view/:id"    : "view"
      "new/"        : "addnew"
      "edit/:id"    : "form"
      "items/skip"  : "list"
      "items/"      : "list"
      "*all"        : "main"

    initialize:()->
      @collection = new Collection(items)

    main:()->
      $.mobile.jqmNavigator.pushView new  Home

    list: (skip)->
      $.mobile.jqmNavigator.pushView new Page collection:@collection 

    view:(id)->
      $.mobile.jqmNavigator.pushView new View model:@collection.get(id)

    form:(id)->
      $.mobile.jqmNavigator.pushView new Form model:@collection.get(id)    

    addnew:()->
      $.mobile.jqmNavigator.pushView new Form collection:@collection, urlBack: '#items/', urlSave: '#view/' + @collection.length
  Router