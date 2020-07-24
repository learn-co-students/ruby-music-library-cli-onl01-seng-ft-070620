

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end #initialize

  def artists
    songs.collect {|song| song.artist}.uniq
  end #artists

  def self.create(name)
    new_inst = self.new(name)
    new_inst.save
    new_inst
  end #create

  def save
    self.class.all << self
  end #save

  def self.all
    @@all
  end #self.all

  def self.destroy_all
    self.all.clear
  end #self.destroy_all

end #Song
