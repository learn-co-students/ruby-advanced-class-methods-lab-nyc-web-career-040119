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
    song = Song.new 
    song.save 
    song
  end 

  def self.new_by_name(namer)
    # binding.pry
    song = self.new
    song.name = namer
    song
  end 

  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    # binding.pry
    new_song.save
    new_song
  end 

  def self.find_by_name(string)
    @@all.find {|x| x.name == string}
  end 

  def self.find_or_create_by_name(song)
   self.find_by_name(song) || self.create_by_name(song) 
  end 

  def self.alphabetical
    # binding.pry
    @@all.sort {|a,b| a.name <=> b.name}
  end 

  def self.new_from_filename(file)
    song_split = file.split(/-/)
    song = self.create_by_name(song_split[1].split(/.mp3/)[0].strip)
    song.artist_name = song_split[0].strip
    song
  end 

  def self.create_from_filename(file)
    song_split = file.split(/-/)
    song = self.create_by_name(song_split[1].split(/.mp3/)[0].strip)
    song.artist_name = song_split[0].strip
    song
  end 

  def self.destroy_all
    @@all.clear
  end 
end
