

class Song

  attr_accessor :name, :artist, :genre
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil && !(genre.songs.include?(self))
      @genre = genre
      genre.songs << (self)
    end
  end

  def save
    @@all << self
  end

  def self.new_from_filename(filename)
    split_data = filename.split(".")[0].split(" - ")
    new_song = Song.new(split_data[1], Artist.find_or_create_by_name(split_data[0]), Genre.find_or_create_by_name(split_data[2]))
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

end
