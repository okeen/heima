# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.showServiceInfo= (service)->
  $(".service_details_panel").hide()
  $(".service_details_panel[data-service-name=#{service}]").show()
  
$ ->
  $("#services_list li a").bind "click",(e) ->
    e.preventDefault()
    service_name = $(e.target).attr("data-service-name")
    showServiceInfo(service_name)
    
  setTimeout =>
    showServiceInfo("imagen_corporativa")
  , 1000