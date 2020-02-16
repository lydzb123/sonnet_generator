require 'pry'

class Sonnet
  attr_accessor :title, :lines, :author, :linecount

  @@all = []
  
  def initialize(attr_hash)
    attr_hash.each do |k, v|
        self.send("#{k}=", v) if self.respond_to?("#{k}=")
     end
    save
  end

  def save
     @@all << self
  end

  def self.all
    @@all
  end

  def self.lines
    all_poem_lines = []
    poem_lines = (self.all.map {|poem| poem.lines })
    all_lines = poem_lines.map {|poem_lines| all_poem_lines << poem_lines }
    all_lines.flatten
  end

end
