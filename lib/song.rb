require 'pry'

class Song

  attr_accessor :name, :song, :artist_name
  @@all = []

  def initialize(*name)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
     # binding.pry
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song
    # binding.pry
  end

  def self.new_by_name(name, artist_name=nil)
    song = Song.new
    song.name = name
    song.artist_name = artist_name
    song
    # binding.pry
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    # song.name = name
    # song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(name)
    filename = name.split(" - ")

    song_name = filename[1][0..-5]
    new_by_name(song_name,filename[0])
  end

  def self.create_from_filename(name)
    new_from_filename(name)
  end

  def self.destroy_all
    @@all.clear
  end

end
