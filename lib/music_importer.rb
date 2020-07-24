require 'pry'

class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files 
        Dir.children("spec/fixtures/mp3s/")
    end 

    def import
        files.each { |filename| Song.create_from_filename(filename) }
    end 

end 