require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end #initialize

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end #create_from_filename

  def self.new_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.gsub('.mp3', '').split(" - ")
    new_song = self.find_or_create_by_name(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_song
  end #new_by_filename

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end #artist=

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end #artist=

  def self.create(name)
    new_inst = self.new(name)
    new_inst.save
    new_inst
  end #create

  def save
    self.class.all << self
  end #save

  def self.all
    @@all
  end #self.all

  def self.destroy_all
    self.all.clear
  end #self.destroy_all

end #Song
