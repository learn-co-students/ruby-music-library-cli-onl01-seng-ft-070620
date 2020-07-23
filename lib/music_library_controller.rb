class MusicLibraryController
    attr_accessor :path

    def initialize(path = './db/mp3s')
        @path = path

        imported_music = MusicImporter.new(path)
        imported_music.import
    end

    def list_songs
        sorted_songs = Song.all.sort_by{|song| song.name}

        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.chomp()

        sorted_songs = Song.all.select{|song| song.artist.name == input}.sort_by{|song| song.name}

        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp()

        sorted_songs = Song.all.select{|song| song.genre.name == input}.sort_by{|song| song.name}

        sorted_songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort_by{|artist| artist.name}

        sorted_artists.each_with_index do |artist, index|
            puts "#{index + 1}. #{artist.name}"
        end
    end

    def list_genres
        sorted_genres = Genre.all.sort_by{|genre| genre.name}

        sorted_genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.chomp()
        input_to_index = input.to_i - 1

        sorted_songs = Song.all.sort_by{|song| song.name}

        if input_to_index <= sorted_songs.length - 1 && input_to_index >= 0
            puts "Playing #{sorted_songs[input_to_index].name} by #{sorted_songs[input_to_index].artist.name}"
        end
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

        quit = nil

        while quit != 1
            input = gets.chomp()

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
            when "exit"
                quit = 1
            end
        end
    end
end