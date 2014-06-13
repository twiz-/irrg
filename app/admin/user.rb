ActiveAdmin.register User do
  permit_params :approved

  index do 
    column :email
    column :last_sign_in_at
    column :approved
    actions
  end
end
