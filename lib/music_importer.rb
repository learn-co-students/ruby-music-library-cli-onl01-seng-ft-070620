class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path # accepts and stores a file path upon initialization
  end
  
  def files
    # takes the file path, retrieves the different file names at that location, and organizes them into an array
    entries = Dir.entries(self.path)
    # from the array, only want elements ends with .mp3 -- ignore blank strings, etc.
    entries.select {|entry| entry.end_with?(".mp3")}
  end
  
  # now that we have an array solely with filename strings (#files), create a new song instance with each of those strings
  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
  
end