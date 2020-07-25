class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    entries = Dir.entries(self.path)
    entries.select {|entry| entry.end_with?(".mp3")}
  end
  
  def import
    files.each { |file| Song.create_from_filename(file) }
  end
  
end