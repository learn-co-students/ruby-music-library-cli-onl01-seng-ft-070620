class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end
  end
  
  def list_songs
    alphabetized = Song.all.sort_by { |s| s.name}
    alphabetized.each_with_index do |element, index| 
      puts "#{index + 1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"
    end
  end
  
  def list_artists
    alphabetized = Artist.all.sort_by { |s| s.name}
    alphabetized.each_with_index do |element, index| 
      puts "#{index + 1}. #{element.name}"
    end
  end
  
  def list_genres
    alphabetized = Genre.all.sort_by { |s| s.name}
    alphabetized.each_with_index do |element, index| 
      puts "#{index + 1}. #{element.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    alphabetized = Song.all.select {|s| s.artist.name == input}.sort_by { |s| s.name }
    alphabetized.each_with_index do |element, index| 
      puts "#{index + 1}. #{element.name} - #{element.genre.name}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    alphabetized = Song.all.select {|s| s.genre.name == input}.sort_by { |s| s.name }
    alphabetized.each_with_index do |element, index| 
      puts "#{index + 1}. #{element.artist.name} - #{element.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    # basically re-creating what #list_songs does
    alphabetized = Song.all.sort_by { |s| s.name}
    placeholder = [] # storing the structured song data
    alphabetized.each_with_index do |element, index| 
      placeholder << "#{index + 1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"
    end
    # shouldn't print anything unless the user input corresponds to a song
    if placeholder.find { |s| s.include?("#{input}.") } != nil
      selection = placeholder.find { |s| s.include?("#{input}.") }.split(" - ")
      puts "Playing #{selection[1]} by #{selection[0].slice(3..-1)}"
    end
  end

end