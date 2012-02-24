# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.showServiceInfo= (service)->
  $(".services_details_panel").hide()
  $(".services_details_panel[data-item_name=#{service}]").show()


$ ->
  $("#services_list li a").bind "click",(e) ->
    #e.preventDefault()
    service_name = $(e.target).attr("data-item_name")
    showServiceInfo(service_name)

  setTimeout =>
    showServiceInfo "imagen_corporativa"
    $(".left_panel li").show()
  , 1