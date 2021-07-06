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
    song = self.new #create new song
    song.save #call on save method to save new song
    song #return new song
  end

  def self.new_by_name(name)
    song = self.new #create new song
    song.name = name #the new song's name equals the input name
    song #return new song
  end

  def self.create_by_name(name)
    song = self.create #use the create method to make a new song
    song.name = name #the new song's name equals the input name
    song #return new song
  end

  def self.find_by_name(name)
    @@all.detect do |song| #detect returns the first item for which the condition is true
      if song.name == name #check if names match
        song #return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song| #sort_by with name defaults to alphabetical
      song.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ") #creates array out of filename
    artist_name = data[0] #locates artist name in new array
    name = data[1].gsub(".mp3", "") #locates song name in new array
    #gsub method replaces (first found) part of string ("to replace", "replacement")

    song = self.new #creates new song
    song.name = name #assigns name to new song
    song.artist_name = artist_name #assigns artist name to new song
    song #returns new song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename) #run previous method to create song
    song.save #save song
    song #return song
  end

  def self.destroy_all
    @@all.clear
  end

end
