# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.showServiceInfo= (service)->
  $(".events_details_panel").hide()
  $(".events_details_panel[data-item-name=#{service}]").show()

window.filterByFamily= (family) ->
  $(".left_panel li").hide()
  items = $(".left_panel li a[data-item-family=#{family}]")
  parents = items.parent();
  
  parents.show();
  
$ ->
  $("#events_list li a").bind "click",(e) ->
    #e.preventDefault()
    service_name = $(e.target).attr("data-item-name")
    showServiceInfo(service_name)
    
  $(".categories_tabs li a").bind "click",(e) ->
    #e.preventDefault()
    item_family = $(e.target).attr("data-item-family")
    filterByFamily(item_family)
    
  setTimeout =>
    showServiceInfo("dia_letras_galegas")
    
  , 10