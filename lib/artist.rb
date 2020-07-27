require 'pry'
require_relative "./concerns/findable.rb"

class Artist
    extend Concerns::Namable
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name  = name
        @songs = []
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
        artist = self.new(name)
        @@all << artist
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
        if @songs.none? { |song_iter| song_iter == song}
            @songs << song
        end
    end

    def genres
        artist_genres = []
        self.songs.collect do |song| 
            artist_genres << song.genre
        end
        artist_genres.uniq
    end


end