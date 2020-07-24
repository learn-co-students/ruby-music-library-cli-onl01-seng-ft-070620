require_relative '../lib/concerns/findable'

class Genre
    extend Concerns::Findable

    attr_accessor :name 

    @@all = []
    
        def initialize(name)
            @name = name
            @songs = []
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

        def songs
           @songs
            # Song.all.select do |song|
            #     song.genre == self
            # end 
        end 

        def self.create(name)
            genre = self.new(name)
            genre.save
            genre
        end 

        def add_song(song)
            songs << song unless songs.include?(song)
            song.genre = self unless song.genre
        end 

        def artists
            songs.map do |song|
                song.artist
            end.uniq
        end 
        
end 

