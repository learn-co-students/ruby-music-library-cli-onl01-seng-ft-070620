class Genre
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
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end
  
  # tests force you to create multiple sources of truth
  # returns a collection of this genre instance's different artists, through their songs
  def artists
    self.songs.map { |song| song.artist }.uniq
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