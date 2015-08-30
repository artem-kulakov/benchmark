# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  
  # Sortable
  $( ".sortable" ).sortable()
  $( ".sortable" ).disableSelection()

  # Reorder
  $('.reorder').click ->
    for element, index in $('.sequence')
      do ->
        element.value = index

  # Formula input
  $('.badge').click ->
    value = $('.notation').val()
    $('.notation').val(value + '[' + $(this).attr('id') + ']')
    $('.notation').focus()
    
    # value = $('.human').text()
    # $('.human').text(value + $(this).attr('title'))
    
    # $('.human').append("<span class='badge'>" + $(this).attr('title') + "</span>");


# Fix turbolinks bug
$(document).ready(ready)
$(document).on('page:load', ready)