require 'pry'
require_relative "./concerns/findable.rb"


class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize (name, artist = nil, genre = nil)
        @name  = name
        if artist != nil
            self.artist= artist
        end
        if genre != nil
            self.genre= genre
        end
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
        song = self.new(name)
        @@all << song
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

    def self.find_by_name(name)
        self.all.find {|song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        if find_by_name(name) != nil
            find_by_name(name)
        else
            create(name)
        end
    end

    def self.new_from_filename(filename)
        parse_song = filename.split(" - ")
        parse_name = parse_song[1]
        parse_artist = Artist.find_or_create_by_name(parse_song[0])
        parse_genre = Genre.find_or_create_by_name(parse_song[2].gsub(".mp3",""))
        self.new(parse_name, parse_artist, parse_genre)
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        @@all << song
    end

end

