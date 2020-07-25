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
  
  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end
  
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