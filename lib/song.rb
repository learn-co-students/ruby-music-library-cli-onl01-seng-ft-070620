require_relative '../lib/concerns/findable'
require 'pry'

class Song
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre 

    @@all = []
    
        def initialize(name, artist=nil, genre=nil)
            @name = name
            self.artist= artist if artist
            self.genre= genre if genre
        end 
    
        def save 
            @@all << self
        end 
    
        def self.all
            @@all
        end 
    
        def self.destroy_all
            self.all.clear
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

        def artist
            @artist 
        end 

        def genre 
            @genre 
        end 

        def genre=(genre)
            @genre = genre 
            genre.add_song(self)
        end 

        def self.new_from_filename(filename)
            data = filename.split(" - ")
            artist = Artist.find_or_create_by_name(data[0])
            genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
            self.new(data[1], artist, genre)
        end 

        def self.create_from_filename(filename)
            self.new_from_filename(filename).save
        end 

end 