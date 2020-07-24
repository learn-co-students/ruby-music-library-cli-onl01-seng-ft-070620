require 'pry'


class MusicLibraryController
attr_accessor :path

    def initialize(path="./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end 

    def list_songs
        sorted_list = Song.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |song, num| puts "#{num + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
    end

    def list_artists
        sorted_list = Artist.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |artist, num| puts "#{num + 1}. #{artist.name}" }
    end 

    def list_genres
        sorted_list = Genre.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |genre, num| puts "#{num + 1}. #{genre.name}" }
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp 
        Song.all.select {|song| song.artist.name == user_input}.sort_by {|song| song.name}.each_with_index do |song, num|
            puts "#{num + 1}. #{song.name} - #{song.genre.name}"
        end 
    end 

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        user_input = gets.chomp 
        Song.all.select {|song| song.genre.name == user_input}.sort_by {|song| song.name}.each_with_index do |song, num|
            puts "#{num + 1}. #{song.artist.name} - #{song.name}"
        end 
    end 

    def play_song
        puts "Which song number would you like to play?" 
        user_input = gets.chomp.to_i
        if (1..Song.all.length).include?(user_input)
            sorted_list = Song.all.sort { |a, b| a.name <=> b.name }
            puts "Playing #{sorted_list[user_input - 1].name} by #{sorted_list[user_input - 1].artist.name}"
        end
    end 

    def call
        user_input = ""
        until user_input == "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
        user_input = gets.chomp
        if user_input == "list songs"
            list_songs
        elsif user_input == "list artists"
            list_artists
        elsif user_input == "list genres"
            list_genres
        elsif user_input == "list artist"
            list_songs_by_artist
        elsif user_input == "list genre"
            list_songs_by_genre
        elsif user_input == "play song"
            play_song
        end 
        end 
    end 

end 
