# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  
  # Action 'new'
  
  # Bulk change of currency
  $('.general-currency select').change ->
    currency_id = $('.general-currency select option:selected').val()
    $(".currency select option[value=#{currency_id}]").attr("selected","selected")


# Fix turbolinks bug
$(document).ready(ready)
$(document).on('page:load', ready)