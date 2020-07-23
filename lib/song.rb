
class Song
    extend Memorable::ClassMethods, Concerns::Findable
    include Memorable::InstanceMethods
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def self.all
        @@all
    end

    def initialize(name, artist = nil, genre = nil)
        self.name = name
        if artist != nil
            self.artist = artist
        end
        if genre != nil
            self.genre = genre
        end
    end

    def artist=(arg)
        @artist = arg
        arg.add_song(self)
    end

    def genre=(arg)
        @genre = arg
        arg.songs << self unless arg.songs.include?(self)
    end

    def self.new_from_filename(file_name)
        arr = file_name.split(/\s-\s|\./)
        artist = Artist.find_or_create_by_name(arr[0])
        genre = Genre.find_or_create_by_name(arr[2])
        song = self.new(arr[1], artist, genre)
    end

    def self.create_from_filename(file_name)
        song = self.new_from_filename(file_name).save
    end
end