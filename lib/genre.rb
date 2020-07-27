require 'pry'
require_relative "./concerns/findable.rb"

class Genre
    extend Concerns::Namable
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize (name)
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
        genre = self.new(name)
        @@all << genre
        genre
    end

    def songs
        @songs
    end

    def artists
        @songs.collect {|s| s.artist}.uniq
    end

end