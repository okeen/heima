# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.showServiceInfo= (service)->
  $(".events_details_panel").hide()
  $(".events_details_panel[data-item-name=#{service}]").show()
  
$ ->
  $("#events_list li a").bind "click",(e) ->
    #e.preventDefault()
    service_name = $(e.target).attr("data-item-name")
    showServiceInfo(service_name)
    
  setTimeout =>
    showServiceInfo("dia_letras_galegas")
  , 10