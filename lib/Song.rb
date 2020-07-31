class Song
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
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
  
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      
    else
      genre.songs << self
    end
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(file)
    array = file.split(" - ")
    songn = array[1]
    artistn = array[0]
    genren = array[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(artistn)
    genre = Genre.find_or_create_by_name(genren)
    self.new(songn, artist, genre)
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
  
end