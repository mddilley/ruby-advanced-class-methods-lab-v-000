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
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    result = ""
    self.all.each do |song|
      result = song if song.name == name
    end
    result != "" ? result : false
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) == false ? Song.create_by_name(name) : Song.find_by_name(name)
  end

end
