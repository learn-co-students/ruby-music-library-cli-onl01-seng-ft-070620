# learn spec/006_artists_and_genres_spec.rb

class Artist < Song
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :artist
  
  def initialize(name)
    super
    @songs = []
  end  
    
  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    unfiltered_genres = self.songs.map {|song| song.genre}
    unfiltered_genres.uniq
  end
  
end