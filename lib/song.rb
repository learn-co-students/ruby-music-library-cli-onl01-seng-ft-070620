# require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist= artist unless artist == nil
        self.genre= genre unless genre == nil
    end

    def self.new_from_filename(filename)
        element = filename.split(" - ") 
        artist = element[0]
        name = element[1]
        genre = element[3]
        song = Song.new
        song.artist = artist
        song.name = name
        song.genre = genre
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save 
        @@all << self
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end
end #class