module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|e| e.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end



# module Findable
  
#   def find_by_name(name)
#     self.all.detect{|object| object.name == name}
#   end
  
#   def self.find_or_create_by_name(name)
#     if find_by_name(name) == nil
#       name = self.new(name)
#     else
#       find_by_name(name)
#     end
#   end
  
# end