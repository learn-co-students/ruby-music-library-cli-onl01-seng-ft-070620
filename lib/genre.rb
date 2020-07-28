class Genre 

    extend Concerns::Findable

    @@all = []

    attr_accessor :name, :songs

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

    def self.create(name)
        song = new(name)
        song.save
        song
    end

    def songs
        @songs
    end

    def artists
        songs.collect {|song| song.artist}.uniq
    end

end
