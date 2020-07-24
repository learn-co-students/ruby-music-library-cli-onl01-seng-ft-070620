class MusicImporter
    attr_accessor :path
    attr_reader :filename

    @@all = []

    def initialize(path)
        @path = path
        @@all << path
    end

    def files
        Dir.children("spec/fixtures/mp3s/")
    end

    def import
       self.files.each {|filename| Song.create_from_filename(filename)}
    end

    
end