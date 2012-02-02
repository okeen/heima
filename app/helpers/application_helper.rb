module ApplicationHelper
  
  def locale_flag(locale)
    content_tag :li, :class => "locale" do
      link_to image_tag("flags/#{locale}.png"), :locale => locale
    end
  end
end
