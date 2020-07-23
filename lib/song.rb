class Song
    extend Concerns::Findable


    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.new_from_filename(filename)
        parsed_file = filename.split(" - ")
        song = self.new(
            parsed_file[1],
            Artist.find_or_create_by_name(parsed_file[0]),
            Genre.find_or_create_by_name(parsed_file[2].chomp(".mp3"))
        )
    end

    def self.create_from_filename(filename)
        song = new_from_filename(filename)
        song.save
    end

end