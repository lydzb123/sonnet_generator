class API #just responsible for making callout to endpoint, to bring in the data
    


    def self.get_data
     sonnet_directory = HTTParty.get("http://poetrydb.org/author,title/Shakespeare;Sonnet")
     sonnet_directory.each do |entry|
         Sonnet.new(entry)
     end
    end
  

end