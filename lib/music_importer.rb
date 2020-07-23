

class MusicImporter

    attr_reader :path 

    def initialize(path)
        @path = path
    end 

    def files
       Dir.entries(path).select do |song|
        song if song.size > 2
       end
    end

end 
