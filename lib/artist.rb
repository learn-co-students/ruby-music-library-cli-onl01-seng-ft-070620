class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs, :artist
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end

    def songs
        Song.all.each{|song| @songs << song if song.artist == self}
        @songs
    end

    def genres
        songs.collect{|song| song.genre}.uniq
    end

    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
    end
end