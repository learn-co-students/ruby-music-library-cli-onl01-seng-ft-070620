module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|a| a.name == name}
  end #find_by_name

  def find_or_create_by_name(name)
    inst = find_by_name(name)
    !inst ? self.create(name) : inst
  end #find_or_create_by_name

end #Concerns::Findable
