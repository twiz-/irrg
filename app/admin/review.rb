ActiveAdmin.register Review do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  index do 
    column :product_image do |image|
      image_tag image.product_image, style: "height:100px;width:100px;"
    end
    column :email
    column :comment
    column :reviewer_image do |image|
      image_tag image.reviewer_image, style: "height:100px;width:100px;"
    end
    column :visibility
    column :product_name
    column :first_name
    column :last_name
     
  end
  
end
