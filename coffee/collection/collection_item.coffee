##############################################
#
# Code Collection
# Version 0.0.1
# 2012-02-1 Alex Suslov
#
##############################################

packages = ['backbone','js/model_item']

define( packages , (BB , Model)->
  Collection = BB.Collection.extend
  	# Mongo style id 
    idAttribute: "_id"
    model:Model
  Collection)
