((function(){window.showServiceInfo=function(a){return $(".events_details_panel").hide(),$(".events_details_panel[data-item-name="+a+"]").show()},window.filterByFamily=function(a){var b,c;return $(".left_panel li").hide(),b=$(".left_panel li a[data-item-family="+a+"]"),c=b.parent(),c.show()},$(function(){var a=this;return $("#events_list li a").bind("click",function(a){var b;return b=$(a.target).attr("data-item-name"),showServiceInfo(b)}),$(".categories_tabs li a").bind("click",function(a){var b;return b=$(a.target).attr("data-item-family"),filterByFamily(b)}),setTimeout(function(){return showServiceInfo("dia_letras_galegas")},10)})})).call(this);