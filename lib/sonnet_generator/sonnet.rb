class Sonnet
  attr_accessor :title, :lines

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

   
  def find_by_letter(name_array)
        new_sonnet = []
        name_array.each do |letter|
            sonnet.lines.first == letter
            new_sonnet << sonnet.lines.first
        end
        new_sonnet
  end
 

end


