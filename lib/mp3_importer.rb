class MP3Importer

  attr_accessor :path

  def initialize(test_music_path)
    @path = test_music_path
  end

  # def files
  #   path=".#{path}"
  # end

  def files
    current_dir = Dir.getwd
    Dir.chdir(@path)
    filenames = Dir.glob("*.mp3")
    Dir.chdir(current_dir)
    filenames
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

end


# [
#   'Action Bronson - Larry Csonka - indie.mp3',
#   'Real Estate - Green Aisles - country.mp3',
#   "Real Estate - It's Real - hip-hop.mp3",
#   'Thundercat - For Love I Come - dance.mp3'
# ]