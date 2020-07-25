# learn spec/009_music_importer_spec.rb --f-f

class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
    # binding.pry
  end
  
  def files
    messy_files = Dir.glob("#{path}/*.mp3").each { |name| name }
    files = messy_files.map do |file|
      file.gsub("#{path}/", "")
    end
  end
  
  def import
    self.files.each { |filename| Song.create_from_filename(filename) }
  end
  
end