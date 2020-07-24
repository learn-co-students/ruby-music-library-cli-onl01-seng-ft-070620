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
end