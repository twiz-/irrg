ActiveAdmin.register User do

  index do 
    column :email
    column :last_sign_in_at
    column :approved
    
  end
  
end
