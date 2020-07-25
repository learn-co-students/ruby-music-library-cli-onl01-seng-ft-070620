require 'pry'
class MusicLibraryController
    attr_reader :path

    def initialize(path = './db/mp3s')
        @path = path
        music_importer = MusicImporter.new(path)
        music_importer.import
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
       
        input = ""
        until input == "exit"
           puts "What would you like to do?"
           input = gets.strip
           
           case input
           when "list songs"
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
        when 'exit'
        end
    end

    end

    def list_songs
        Song.all.sort {|a, b| a.name <=> b.name}.each_with_index do |song, index|
            # binding.pry
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index do |genre, index|
            puts "#{index +1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_input = gets.chomp()
        if fav_artist = Artist.find_by_name(artist_input)
            fav_artist.songs.sort_by! {|song| song.name}.each_with_index do |song, index|
                puts "#{index + 1}. #{song.name} - #{song.genre.name}"
            end
        end        
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_input = gets.chomp()
        if genre_input = Genre.find_by_name(genre_input)
            # binding.pry
            genre_input.songs.sort_by! {|song| song.name}.each_with_index do |song, index|
                puts "#{index + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        song_choice = gets.chomp.to_i

        Song.all.sort_by! {|song| song.name}.each_with_index do |song, index|
            if index + 1 == song_choice
                puts "Playing #{song.name} by #{song.artist.name}"
            end
        end
    end
end