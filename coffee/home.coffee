##########################################
#
#  Index
#  Version 0.0.1
#  2012-02-01 Alex Suslov (@alexsuslov)
#
##########################################

packages = [
  'backbone',
  'underscore'
  "text!view/index.html"
]

define packages , (BB, _ , Tpl) ->
  # BB.history.start()

  View = BB.View.extend
    render: ->
      @$el.html _.template(Tpl)
      @
