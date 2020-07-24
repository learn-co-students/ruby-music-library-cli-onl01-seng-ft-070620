require 'pry'
module Memorable
    module ClassMethods
        def destroy_all
            self.all.clear
        end

        def count
            self.all.length
        end

        def create(name)
            inst = self.new(name)
            inst.save
            inst
        end
    end

    module InstanceMethods
        
        def save  
            self.class.all << self
        end
    end
end