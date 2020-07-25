# learn spec/006_artists_and_genres_spec.rb

class Genre < Song
  extend Concerns::Findable
  attr_accessor :songs
  
  def initialize(name)
    super
    @songs = []
  end

  def artists
    unfiltered_artists = self.songs.map {|song| song.artist}
    unfiltered_artists.uniq
  end





end