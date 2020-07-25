class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end
  
  # only want to add this new song if it hasn't been created already
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  # tests force you to create multiple sources of truth
  # return a collection of this artist instance's different genres, through their songs
  def genres
    self.songs.map { |song| song.genre }.uniq
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