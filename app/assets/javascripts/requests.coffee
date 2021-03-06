# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

get_params = ->
  query = window.location.search.substring(1)
  raw_vars = query.split("&")

  params = {}

  for v in raw_vars
    [key, val] = v.split("=")
    params[key] = decodeURIComponent(val)

  params

requests_accordion = ->
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

active_request = ->
  return $('.accordion .active').length > 0

refresh_requests_partial = ->
  unless active_request()
    $.ajax ({
      url:"/manage_requests.js?queue_type=" + get_params().queue_type
      context: document.body, 
      success: (data) ->
        requests_accordion()
    })
  return

$(document).on 'ready page:load', -> 
  # Refresh the requests in index every 5 seconds
  if $('#manage_requests_page').length > 0
    setInterval refresh_requests_partial, 5000
  
  if $("#new_request_page").length > 0
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
  requests_accordion()
  return

