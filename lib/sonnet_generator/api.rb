require 'HTTParty'
require 'pry'

class API
    include HTTParty
    page = HTTParty.get("http://poetrydb.org/author,title/Shakespeare;Sonnet")
    page
    binding.pry

end