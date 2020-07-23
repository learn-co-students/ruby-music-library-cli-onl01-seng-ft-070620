require 'pry'

class Song

    attr_accessor :name
    attr_reader :genre, :artist 

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        artist != nil ? self.artist=(artist) : @artist = nil
        genre != nil ? self.genre=(genre) : @genre = nil 
    end

    def self.all 
        @@all 
    end 

    def self.destroy_all
        self.all.clear 
    end 

    def save 
        @@all << self
    end 

    def self.create(name)
        song = self.new(name) 
        song.save 
        song
    end 

    def artist=(artist) 
        @artist = artist 
        artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre 
        genre.songs << self if !genre.songs.include?(self)
    end


end 