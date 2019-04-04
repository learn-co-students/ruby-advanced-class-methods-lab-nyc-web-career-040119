require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all.last
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
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ").first
    title = filename.split(" - ").last.gsub(".mp3","")
    song = Song.new
    song.name = title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ").first
    title = filename.split(" - ").last.gsub(".mp3","")
    song = Song.create
    song.name = title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end

end
