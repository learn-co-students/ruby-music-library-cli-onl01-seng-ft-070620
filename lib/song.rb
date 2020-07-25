class Song
  # extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.genre=(genre) if genre
    self.artist=(artist) if artist
    self.save
  end

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    artist = filename.split(/ - |.mp3/)[0]
    title = filename.split(/ - |.mp3/)[1]
    genre = filename.split(/ - |.mp3/)[2]
      
    song = Song.new(title)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

end