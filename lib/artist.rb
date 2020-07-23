
class Artist
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

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.artist = self unless song.artist
    end

    def genres
        self.songs.collect{|song| song.genre}.uniq
    end
end