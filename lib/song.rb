require 'pry'

class Song
  attr_accessor :name, :artist_name, :filename

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |songs|
      songs.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.filename = filename
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1].split(".")[0]
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
# binding.pry


end
