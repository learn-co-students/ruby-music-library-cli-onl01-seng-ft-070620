class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs, :genre
    @@all = []

    def initialize(name, genre = nil)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def songs
        @songs
    end

    def artists
        songs.collect{|song| song.artist}.uniq
    end

    def add_song(song)
        song.genre = self unless song.genre
        songs << song unless songs.include?(song)
    end
end