

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        song_imp = MusicImporter.new(path)
        song_imp.import 
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
        user_input = ""
        until user_input == "exit"
            puts "What would you like to do?"
            user_input = gets.chomp
            end
    end

    def list_songs
        sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end 

    def list_artists
        sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
        sorted_artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres 
        sorted_genres = Genre.all.sort {|a, b| a.name <=> b.name}
        sorted_genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.chomp
        list = Song.all.select {|song| song.artist.name == user_input}
        list_sorted = list.sort {|a, b| a.name <=> b.name}
        list_sorted.each_with_index do |song, index|
            puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end 
    end

    def list_songs_by_genre 
        puts "Please enter the name of a genre:"
        user_input = gets.chomp
        list = Song.all.select {|song| song.genre.name == user_input}
        list_sorted = list.sort {|a, b| a.name <=> b.name}
        list_sorted.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
    end 

    def play_song
        puts "Which song number would you like to play?"
        user_input = gets.chomp
        puts "Playing SONGNAME by ARTIST"
    end 
    
end 
