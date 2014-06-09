module LocationsHelper
  
  def full_name(name)
    name.first_name + " " + name.last_name[0].upcase + "."
  end
  
  def visibile(eval)
    if eval == true
      return "Yes"
    else
      return "Nope"
    end
  end
end
