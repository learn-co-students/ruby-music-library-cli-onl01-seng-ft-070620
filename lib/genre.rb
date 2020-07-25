class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end


end




# class Genre 
  
#   extend Concerns::Findable
  
#   attr_accessor :name
#   @@all = []
  
#   def initialize(name)
#     @name = name
#     save
#   end
  
#   def self.all
#     @@all
#   end
#   def save
#     @@all << self
#   end
  
#   def self.destroy_all
#     self.all.clear
#   end
  
#   def self.create(name)
#   genre = Genre.new(name)
#   genre.save
#   genre
#   end
  
#   def self.count
#     @@all.size
#   end
  
 
  
# end