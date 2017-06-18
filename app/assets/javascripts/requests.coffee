# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', -> 
  if $('#manage_requests_page').length > 0
    setInterval refresh_requests_partial, 5000
  
  
	$(".question").show()
	$(".support").hide()
	$(".demo").hide()
		
	$('#question').click ->
  	$(".question").fadeIn('slow')
  	$(".support").hide()
  	$(".demo").hide()
  	
	$('#support').click ->
  	$(".question").hide()
  	$(".support").fadeIn('slow')
  	$(".demo").hide()
  	
	$('#demo').click ->
  	$(".question").hide()
  	$(".support").hide()
  	$(".demo").fadeIn('slow')

$ ->
  $('.accordion').find('.theme').click ->
    $(this).next('.abstract').slideToggle 'fast', ->
      curr = $(this).prev('div').children('h4')
      curr.toggleClass 'active'
      if curr.hasClass('active')
        curr.children('b').css
          'border-top-color': '#333333'
          'border-left-color': 'transparent'
      else
        curr.children('b').css
          'border-top-color': 'transparent'
          'border-left-color': '#555555'
      return
    return
  return

refresh_requests_partial = ->
  $.ajax url:"/manage_requests.js"
  return