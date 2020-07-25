class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ?  self.artist = artist : @artist = nil
    genre != nil ?  self.genre = genre : @genre = nil
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
    genre.add_song(self)  # invokes Genre#add_song to add the song to the genre's collection of songs
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
  
  def self.new_from_filename(filename)
    clean = filename.split(" - ")
    song_name = clean[1] # extract the song string
    artist_name = clean[0] # extract the artist string
    genre_name = clean[2].gsub(".mp3", "") # extract the genre string
    
    artist_obj = Artist.find_or_create_by_name(artist_name) # create a new Artist instance
    genre_obj = Genre.find_or_create_by_name(genre_name) # create a new Genre instance
    
    self.new(song_name, artist_obj, genre_obj) # create a new Song instance, with the Artist and Genre instances
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
end
