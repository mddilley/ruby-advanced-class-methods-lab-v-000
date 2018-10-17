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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    result = ""
    @@all.each do |song|
      result = song if song.name == name
    end
    result != "" ? result : false
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == false ? find_by_name(name) : create_by_name(name)
  end

end
