class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select{ |song| song.artist == self }
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    selected_artist = self.all.find{ |artist| artist.name == name }
    selected_artist ? selected_artist : Artist.new(name)
  end

  def print_songs
    Song.all.each{ |song| puts song.name if song.artist == self }
  end

end