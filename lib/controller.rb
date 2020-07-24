require 'pry'

class MusicLibraryController

  attr_reader :path

  DEFAULT_PATH = "./db/mp3s"

  def initialize(path = DEFAULT_PATH)
    @path = path
    importer = MusicImporter.new(path)
    importer.import
    # self.call
  end #initialize

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.chomp

    case input
    when 'list songs'
      self.list_songs
      self.call
    when 'list artists'
      self.list_artists
    when 'list genres'
      self.list_genres
    when 'list artist'
      self.list_songs_by_artist
    when 'list gerne'
      self.list_songs_by_genre
    when 'play song'
      self.list_songs
      self.play_song
    when 'exit'
      exit
    else
      self.call
    end #case
  end #call

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end #do
  end #list_songs

  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end #do
  end #list_artists

  def list_genres
    Genre.all.sort {|a,b| a.name <=> b.name}.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end #do
  end #list_genres

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end #do
    end #if
  end #list_songs_by_artist

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end #do
    end #if
  end #list_songs_by_genre

  def play_song
    puts "Which song number would you like to play?"
    index = gets.chomp.to_i-1
    if (0...Song.all.length-1).include?(index)
      binding.pry
      array = Song.all.sort {|a,b| a.name <=> b.name}
      puts "Playing #{array[index].name} by #{array[index].artist.name}"
    end #if
  end #play_song

end #MusicLibraryController
