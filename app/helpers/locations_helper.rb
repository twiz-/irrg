module LocationsHelper
  
  def full_name(name)
    name.first_name + " " + name.last_name[0].upcase + "."
  end
end
