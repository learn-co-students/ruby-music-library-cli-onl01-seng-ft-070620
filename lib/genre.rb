
class Genre
    extend Memorable::ClassMethods, Concerns::Findable
    include Memorable::InstanceMethods
    attr_accessor :name, :songs
    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        self.name = name
        @songs = []
    end

    def songs
        @songs
    end

    def artists
        self.songs.collect{|song| song.artist}.uniq
    end

end