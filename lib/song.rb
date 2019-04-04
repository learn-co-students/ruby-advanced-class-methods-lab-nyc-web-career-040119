require 'pry'

class Song
  attr_accessor :name, :artist_name
  attr_reader :song
  @@all = []
# binding.pry
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

  def name=(song)
    @name = song
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
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(name)
    file = name.gsub(".mp3","").split(" - ")
    song = Song.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(name)
    file = name.gsub(".mp3","").split(" - ")
    song = Song.create
    song.name = file[1]
    song.artist_name = file[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
