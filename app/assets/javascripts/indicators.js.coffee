# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  
  # Action 'edit_all'
  
  # Sortable
  $( ".sortable" ).sortable()
  $( ".sortable" ).disableSelection()

  # Reorder
  $('.reorder').click ->
    for element, index in $('.sequence')
      do ->
        element.value = index

  
  # Action 'new'
  
  # Keep indicator title after formula added or hidden
  $('.toggle-formula').click ->
    value = $('.title').val()
    _href = $('.toggle-formula a').attr('href')
    $('.toggle-formula a').attr('href', _href + '&title=' + value)
  
  # Input indicators to formula
  $('.indicator-tag').click ->
    value = $('.notation').val()
    $('.notation').val(value + '[' + $(this).attr('id') + ']')
    $('.notation').focus()


# Fix turbolinks bug
$(document).ready(ready)
$(document).on('page:load', ready)