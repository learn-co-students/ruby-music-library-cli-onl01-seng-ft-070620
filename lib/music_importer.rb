class MusicImporter
    attr_accessor :path

    @@all = []

    def initialize(path)
        @path = path
        @@all << path
    end

    def files
        Dir.children("spec/fixtures/mp3s/")
    end

    
end