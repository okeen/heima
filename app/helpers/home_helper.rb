module HomeHelper
  
  def customers_photos
    Dir.glob("#{Rails.root}/app/assets/images/customers/*.png").inject("") { |list,customer_image_path|
      image_filename= customer_image_path.split("/").last
      content_tag :li, :class => "cutomer_logo" do
        image_tag image_path("customers/#{image_filename}"), 
                  :alt => image_filename.split(".").first
      end
    } 
  end
end
