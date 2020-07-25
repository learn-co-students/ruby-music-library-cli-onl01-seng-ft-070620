class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.genre=(genre) unless genre == nil
    self.artist=(artist) unless artist == nil
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
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist unless artist == nil
    if self.artist != nil
      @artist.add_song(self) unless artist.songs.include?(self)
    end
  end
  
  def genre=(genre)
    @genre = genre unless genre == nil
    if self.genre != nil
      genre.songs << self unless genre.songs.include?(self)
    end
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
    song = self.new_from_filename(filename)
    song.save
    song
  end

  
end