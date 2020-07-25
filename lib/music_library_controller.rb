class MusicLibraryController
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

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
    input = gets.chomp.downcase
    case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      else self.call unless input == "exit"
    end
  end

  def list_songs
    sort_by_name = Song.all.uniq.sort_by { |song| song.name }
    sort_by_name.each_with_index do |song, index|
      puts "#{index += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort_by_artist = Artist.all.sort_by { |artist| artist.name }
    sort_by_artist.each_with_index do |artist, index|
      puts "#{index += 1}. #{artist.name}"
    end    
  end

  def list_genres
    sort_by_genre = Genre.all.sort_by { |genre| genre.name }
    sort_by_genre.each_with_index do |genre, index|
      puts "#{index += 1}. #{genre.name}"
    end  
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input) != nil
      artist = Artist.find_by_name(input)
      sort_songs = artist.songs.sort_by { |song| song.name }
      sort_songs.each_with_index do |song, index|
        puts "#{index += 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input) != nil
      genre = Genre.find_by_name(input)
      sort_songs = genre.songs.sort_by { |song| song.name }
      sort_songs.each_with_index do |song, index|
        puts "#{index += 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    sort_by_name = Song.all.sort_by { |song| song.name }
    input = gets.chomp.to_i
    if (0..Song.all.length-1).include?(input-1)
      puts "Playing #{sort_by_name[input-1].name} by #{sort_by_name[input-1].artist.name}"
    end
  end

end