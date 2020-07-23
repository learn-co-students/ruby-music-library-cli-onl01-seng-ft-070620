require 'pry'

class Genre 

    attr_accessor :name 
    attr_reader :songs 

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        genre = self.new(name) 
        genre.save
        genre 
    end 

    def artists
        self.songs {|song| song.artist}
    end 

end 