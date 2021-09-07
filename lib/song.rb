class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    split_file = file.split(' - ')
    new_song = self.new(split_file[1])
    new_song.artist_name=(split_file[0])
    new_song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end