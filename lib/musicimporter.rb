

class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end #initialize

  def files
    files ||= Dir.glob("#{self.path}/*.mp3").collect {|file| file.gsub("#{self.path}/", '')}
  end #files

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end #import

end #MusicImporter
