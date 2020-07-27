

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ''
    puts "Welcome to your music library!"
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets

      self.list_songs if input == "list songs"
      self.list_artists if input == "list artists"
      self.list_genres if input == "list genres"
      self.list_songs_by_artist if input == "list artist"
      self.list_songs_by_genre if input == "list genre"
      self.play_song if input == "play song"
    end
  end

  def list_songs
    counter = 1
    sorted_titles = Song.all.collect{|song| song.name}
    sorted_titles.sort.each{|title|
      song = Song.find_by_name(title)
      puts "#{counter}. #{song.artist.name} - #{title} - #{song.genre.name}"
      counter += 1
    }
  end

  def list_artists
    counter = 1
    sorted_names = Artist.all.collect{|artist| artist.name}
    sorted_names.sort.each{|name|
      puts "#{counter}. #{name}"
      counter += 1
    }
  end

  def list_genres
    counter = 1
    sorted_names = Genre.all.collect{|genre| genre.name}
    sorted_names.sort.each{|name|
      puts "#{counter}. #{name}"
      counter += 1
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    counter = 1
    sorted_songs = []
    Song.all.each{|song| sorted_songs << song.name if song.artist.name == artist}
    sorted_songs.sort.each{|name|
      song = Song.find_by_name(name)
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    counter = 1
    sorted_songs = []
    Song.all.each{|song| sorted_songs << song.name if song.genre.name == genre}
    sorted_songs.sort.each{|name|
      song = Song.find_by_name(name)
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
    }
  end

  def play_song
    puts "Which song number would you like to play?"
    num = gets.to_i
    sorted_names = []
    sorted_songs = []
    Song.all.each{|song| sorted_names << song.name}
    sorted_names.sort.each{|name|
      sorted_songs << Song.find_by_name(name)
    }
    puts "Playing #{sorted_songs[num - 1].name} by #{sorted_songs[num - 1].artist.name}"unless num < 1 || num > Song.all.length
  end

end
