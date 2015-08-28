# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $( ".sortable" ).sortable()
  $( ".sortable" ).disableSelection()

  $('.reorder').click ->
    for element, index in $('.sequence')
      do ->
        element.value = index

$(document).ready(ready)
$(document).on('page:load', ready)