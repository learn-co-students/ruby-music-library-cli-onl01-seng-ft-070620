class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path # accepts and stores a file path upon initialization
  end
  
  def files
    # takes the file path, retrieves the different file names at that location, 
    entries = Dir.entries(self.path)
    binding.pry
    entries.select {|entry| entry.end_with?(".mp3")}
  end
  
  def import
    files.each { |file| Song.create_from_filename(file) }
  end
  
end