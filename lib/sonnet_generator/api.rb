class API #just responsible for making callout to endpoint, to bring in the data
    


    def self.get_data
     sonnet_directory = HTTParty.get("http://poetrydb.org/author,title/Shakespeare;Sonnet")
     sonnet_directory.each do |entry|
         Sonnet.new(entry)
     end
    end
  
#  def self.generate_acrostic(name) #classmethods
#     all_lines.each do |sonnet|
#         sonnet.each do |line|
#             if line[0] == "F"  #instead of "F" I want to go through an array of @@name
#             new_poem << line
#             binding.pry
#             end
#         end
#     end
#  end

end