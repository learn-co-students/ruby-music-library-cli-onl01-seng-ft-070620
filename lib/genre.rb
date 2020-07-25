# learn spec/004_songs_and_artists_spec.rb

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  # attr_reader
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self unless self.class.all.include?(self)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def artists
    self.songs.map {|song| song.artist}.uniq
  end
  
  
  
end

# @artist = artist unless artist==nil