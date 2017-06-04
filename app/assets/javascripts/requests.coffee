# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
		$(".question").hide()
		$(".support").hide()
		$(".demo").hide()
  		
		$('#question').click ->
    	$(".question").show()
    	$(".support").hide()
    	$(".demo").hide()
    	
		$('#support').click ->
    	$(".question").hide()
    	$(".support").show()
    	$(".demo").hide()
    	
		$('.demo').click ->
    	$(".question").hide()
    	$(".support").hide()
    	$(".demo").show()