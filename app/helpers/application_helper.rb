module ApplicationHelper
  
  def locale_flag(locale)
    content_tag :li, 
        :class => "locale #{'current_locale' if I18n.locale == locale}",
        :style => I18n.locale == locale ? "" : "display:none" do
      link_to image_tag("flags/#{locale}.png"), :locale => locale
    end
  end
  
  def big_panel_link(item, item_category)
    content_tag :li do
      item, item_family = item.split ":"
      link_to t("#{item_category}.#{item}.name"), "##{item}", 
              "data-item-name" => item,
              "data-item-family" => item_family
              
    end
  end
  
  def big_panel_details_panel(item, item_category)
    item, item_family = item.split ":"
    content_tag :div, 
      :class => "#{item_category}_details_panel", 
      "data-item-name" => item,
      "data-item-family" => item_family,
      :style => "display:none"     do 
          content_tag(:h2, t("#{item_category}.#{item}.name"))+
          content_tag(:p, t("#{item_category}.#{item}.description"))+
          image_tag( image_path("#{item_category}/item.jpg"), :alt => item)          
            
    end
  end
  
  def authors_link
    link_to "etware", "http://www.etware.es"
  end
end
