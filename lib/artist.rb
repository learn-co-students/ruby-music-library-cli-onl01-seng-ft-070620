class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader
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
    artist = self.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end
  
  def genres
    self.songs.map {|song| song.genre}.uniq
  end  
  
end