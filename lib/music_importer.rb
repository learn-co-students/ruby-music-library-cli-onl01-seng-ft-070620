class MusicImporter
    attr_accessor :path
    attr_reader :filename

    @@all = []

    def initialize(path)
        @path = path
        @@all << path
    end

    def files
        Dir.children(self.path)
    end

    def import
       self.files.each {|filename| Song.create_from_filename(filename)}
    end
end