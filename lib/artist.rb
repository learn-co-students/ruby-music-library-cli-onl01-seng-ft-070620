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
    # if song.artist == nil # if song, a Song object, doesn't already have an artist...
    #   song.artist = self # assign the current artist instance to that Song object
    #   self.songs << song # add the new song to this artist's collection of songs
    # end
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    # get all Song objects where its artist attribute is equal to this artist instance
    # go through those Song objects, for this artist, and get their genres
    # Song.all.select { |song| song.artist == self }.map { |song| song.genre }.uniq
    binding.pry
    Song.all
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