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

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        Song.all.each{|song| @songs << song if song.genre == self}
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