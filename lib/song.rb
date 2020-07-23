class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    
    artist != nil ?  self.artist = artist : @artist = nil
    genre != nil ?  self.genre = genre : @genre = nil
    
    # if artist != nil # only want to invoke #artist= if initializing with an artist object
    #   self.artist = artist
    # end
    # if genre != nil # only want to invoke #genre= if initializing with a genre object
    #   self.genre = genre
    # end

  end
  
  def save
    self.class.all << self
  end
  
  def artist=(artist)
    @artist = artist # sets this song instance's artist property
    artist.add_song(self) # invokes Artist#add_song to add the song to the artist's collection of songs
  end
  
  def genre=(genre) # different approach than #artist=
    @genre = genre # sets this song instance's genre property
    genre.songs << self unless genre.songs.include?(self) # add the song to the genre's collection of songs, unless the genre is already part of the collection
  end
    
  def self.all
    @@all
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  # def self.find_by_name(name)
  #   self.all.find { |song| song.name == name }
  # end
  
  # def self.find_or_create_by_name(name)
  #   self.all.select { |song| song.name == name }.uniq
  # end
  
end
