require 'pry'

class MusicLibraryController

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(@path).import
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
            case input 
                when "list songs" 
                    list_songs
                when "list artists"
                    list_artists
                when "list genres"
                    list_genres
                when "list artist"
                    list_songs_by_artist
                when "list genre"
                    list_songs_by_genre
                when "play song"
                    play_song
            end
        end
    end

    def list_songs
        alpabetical_songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name }
        count = 1
        alpabetical_songs.each do |song|
            puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            count += 1
        end
    end

    def list_artists
        alpabetical_artists = Artist.all.sort {|artist_a, artist_b| artist_a.name <=> artist_b.name}
        count = 1
        alpabetical_artists.each do |artist|        
            puts "#{count}. #{artist.name}"
            count += 1
        end
    end

    def list_genres
        alpabetical_genres = Genre.all.sort {|genre_a, genre_b| genre_a.name <=> genre_b.name}
        count = 1
        alpabetical_genres.each do |genre|        
            puts "#{count}. #{genre.name}"
            count += 1
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        count = 1
        sorted_songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
        sorted_songs.collect do |song|
            if song.artist.name == input
                puts "#{count}. #{song.name} - #{song.genre.name}"
                count += 1
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        count = 1
        sorted_songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name}
        sorted_songs.collect do |song|
            if song.genre.name == input
                puts "#{count}. #{song.artist.name} - #{song.name}"
                count += 1
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip
        alpabetical_songs = Song.all.sort {|song_a, song_b| song_a.name <=> song_b.name }
        alpabetical_songs.each_with_index do |song, index|
            if index+1 == input.to_i 
                puts "Playing #{song.name} by #{song.artist.name}"
            end
        # binding.pry
        end

    #     play_song
    #     prompts the user to choose a song from the alphabetized list output by #list_songs
    #           Which song number would you like to play?
    #     accepts user input
    #     upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs (FAILED - 1)
    #     does not 'puts' anything out if a matching song is not found
    #     checks that the user entered a number between 1 and the total number of songs in the library
    end
end



