##############################################
#
# Row
# Version 0.0.1
# 2012-02-01 Alex Suslov
#
##############################################


packages = ['backbone','jquery','underscore']

define( packages , ( BB, $, _)->
  template = _.template(
    [ '<a href= "#view/<%= _id %>">'
      '<%= name %>'
      '</a>'
    ].join('')
    )
  Row = BB.View.extend
    tagName:'li'
    template: template
    render:()->
      @el.innerHTML = @template @model.toJSON()
      @
  Row)