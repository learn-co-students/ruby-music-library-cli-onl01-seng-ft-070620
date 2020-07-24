require 'pry'


class MusicLibraryController
attr_accessor :path

    def initialize(path="./db/mp3s")
        @path = path
        MusicImporter.new(path).import
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
        end 
    end 

    def list_songs
        sorted_list = Song.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |song, num| puts "#{num + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
    end

    def list_artists
        sorted_list = Artist.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |artist, num| puts "#{num}. #{artist.name} - #{artist.song.name} - #{artist.genres.name}" }
    end 

    def list_genres
        sorted_list = Genre.all.sort { |a, b| a.name <=> b.name }
        sorted_list.each_with_index { |genre, num| puts "#{num}. #{genre.artist.name} - #{genre.song.name} - #{genre.name}" }
    end 

    def list_songs_by_artist

    end 

    def list_songs_by_genre

    end 

    def play_song

    end 


end 