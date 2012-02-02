module ServicesHelper
  
  def service_link(service)
    link_to t("services.#{service}.name"), "#", "data-service-name" => service 
  end
  
  def service_details_panel(service)
    content_tag :div, 
      :class => "service_details_panel", 
      "data-service-name" => service,
      :style => "display:none"     do 
          content_tag(:h1, t("services.#{service}.name"))+
          content_tag(:p, t("services.#{service}.description"))+
          image_tag( image_path("services/#{service}"), :alt => service)          
            
    end
  end
end
