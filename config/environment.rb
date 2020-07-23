require 'bundler'
require 'pry'
Bundler.require

module Concerns
end

require_all 'lib'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    if artist != nil # only want to invoke #artist= if initializing with an artist object
      self.artist = artist
    end
    if genre != nil # only want to invoke #genre= if initializing with a genre object
      self.genre = genre
    end
    
  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist # sets this song instance's artist property
    artist.add_song(self) # invokes Artist#add_song to add the song to the artist's collection of songs
  end
  
  def genre=(genre) # different approach than #artist=
    @genre = genre # sets this song instance's genre property
    genre.songs << self unless genre.songs.include?(self) # add the song to the genre's collection of songs, unless the genre is already part of the collection
  end
    
  def self.all
    @@all
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end  
  
end

class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end
  
  def add_song(song)
    if song.artist == nil # if song, a Song object, doesn't already have an artist...
      song.artist = self # assign the current artist instance to that Song object
      self.songs << song # add the new song to this artist's collection of songs
    end
  end
  
  def genres
    # get all Song objects where its artist attribute is equal to this artist instance
    # go through those Song objects, for this artist, and get their genres
    Song.all.select { |song| song.artist == self }.map { |song| song.genre }
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end

class Genre
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end

  def self.all
    @@all
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def self.destroy_all
    self.all.clear
  end

end