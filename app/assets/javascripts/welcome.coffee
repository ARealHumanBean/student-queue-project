# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  # get current URL path and assign 'active' class
  pathname = window.location.pathname
  console.log("test")
  console.log(pathname)
  $('.nav > li > a[href="' + pathname + '"]').parent().addClass 'disabled not-active'
  return
