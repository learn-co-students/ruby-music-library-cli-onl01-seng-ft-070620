require 'pry'

class MusicImporter

    @@all = []

    def initialize(path)
        @path = path
        @@all << self
    end

    def path
        @path
    end

    def files
        path_var = Dir.glob("#{@path}/*.mp3")
        path_var.collect {|file| file.gsub("#{@path}/", "")}
    end

    def import 
        self.files.each do |filename|
            Song.create_from_filename(filename)
        end
    end



end


