require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end #initialize

  def genres
    songs.collect {|song| song.genre}.uniq
  end #genres

  def add_song(song)
    song.artist = self if !song.artist
    self.songs << song if !@songs.include?(song)
  end #add_song

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
