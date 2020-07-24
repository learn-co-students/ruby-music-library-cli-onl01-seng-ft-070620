require 'pry'


class MusicLibraryController

    def initialize(path="./db/mp3s")
        Song.destroy_all
        Artist.destroy_all
        Genre.destroy_all
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
        puts "What would you like to do?"
        input = gets.chomp
        until input == "exit"
            input = gets.chomp
            # case input
            # when "list songs"
            #     Song.all.each{|song| puts song.name}
            # when "list artists"
            #     Artist.all.each{|artist| puts artist.name}
            # when "list genres"
            #     Genre.all.each{|genre| puts genre.name}
            # end
        end
    end

    def list_songs
        sorted = Song.all.sort_by{|song| song.name}
        sorted.each_with_index do |song, i|
            puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        sorted = Artist.all.sort_by{|artist| artist.name}
        sorted.each_with_index do |artist, i|
            puts "#{i+1}. #{artist.name}"
        end
    end

    def list_genres
        sorted = Genre.all.sort_by{|genre| genre.name}
        sorted.each_with_index do |genre, i|
            puts "#{i+1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        a = gets.chomp
        if Artist.find_by_name(a)
            sorted = Artist.find_by_name(a).songs.sort_by{|song| song.name}
            sorted.each_with_index do |song, i|
                puts "#{i+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        g = gets.chomp
        if Genre.find_by_name(g)
            sorted = Genre.find_by_name(g).songs.sort_by{|song| song.name}
            sorted.each_with_index do |song, i|
                puts "#{i+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
    end


end
