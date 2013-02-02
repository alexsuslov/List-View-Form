#############################################
#
# Main
#  Version 0.0.1
#  2012-02-01 Alex Suslov (@alexsuslov)
#
#############################################
require.config
  baseUrl: "/"
  paths:
    # RequireJS plugin
    text: "lib/text/text"
    # RequireJS plugin
    domReady: "lib/domReady/domReady"
    # jQuery Mobile framework
    jqm: "lib/jquery.mobile/jquery.mobile-1.2.0"
    # jQuery Mobile plugin for Backbone views navigation
    jqmNavigator: "lib/jquery.mobile/jqmNavigator"
    # Backbone.js library
    backbone: "lib/backbone/backbone"

  shim:
    # backbone:
    #   deps: ["underscore", "jquery"]
    #   exports: "backbone"
    # underscore:
    #   exports: "_"
    jqm:
      deps: ["jquery", "jqmNavigator"]

require ["domReady", "js/router_item", "jqm"], (domReady, Router) ->
  ###
  # Created by Piotr Walczyszyn (@pwalczyszyn)

  # User: pwalczys
  # Date: 2/16/12
  # Time: 9:20 AM
  ###
  # domReady is RequireJS plugin that triggers when DOM is ready
  domReady ->
    onDeviceReady = (desktop) ->

      # Hiding splash screen when app is loaded
      cordova.exec null, null, "SplashScreen", "hide", []  if desktop isnt true

      # Setting jQM pageContainer to #container div, this solves some jQM flickers & jumps
      # I covered it here: http://outof.me/fixing-flickers-jumps-of-jquery-mobile-transitions-in-phonegap-apps/
      $.mobile.pageContainer = $("#container")
      $.mobile.ajaxEnabled = false
      $.mobile.linkBindingEnabled = false
      $.mobile.hashListeningEnabled = false
      $.mobile.pushStateEnabled = false

      # Setting default transition to slide
      # $.mobile.defaultPageTransition = "slide"

      # Pushing MainView
      # $.mobile.jqmNavigator.pushView new Index()
      router = new Router()
      Backbone.history.start()
      $('div[data-role="page"]').live 'pagehide', (event, ui)->
        $(event.currentTarget).remove()


    # if navigator.userAgent.match(/(iPad|iPhone|Android)/)

    #   # This is running on a device so waiting for deviceready event
    #   document.addEventListener "deviceready", onDeviceReady, false
    # else

      # On desktop don't have to wait for anything
      onDeviceReady true