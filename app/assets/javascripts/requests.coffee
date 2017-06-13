# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', -> 
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