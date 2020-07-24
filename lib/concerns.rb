module Concerns
    module Findable
        def find_by_name(arg)
            self.all.detect {|a| a.name == arg}
        end
    
        def find_or_create_by_name(arg)
            if self.find_by_name(arg)
                self.find_by_name(arg)
            else
                self.create(arg)
            end
        end
    end

    # module Memorable
    #     module ClassMethods
    #         def destroy_all
    #             self.all.clear
    #         end
    
    #         def count
    #             self.all.length
    #         end
    
    #         def create(name)
    #             inst = self.new(name)
    #             inst.save
    #             inst
    #         end
    #     end
    
    #     module InstanceMethods
    #         # def initialize(name)
    #         #     self.name = name
    #         # end
            
    #         def save  
    #             self.class.all << self
    #         end
    #     end
    # end
end