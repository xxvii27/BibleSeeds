class BooksController < ApplicationController
	
	def index
	    	  @books = Book.all
	  	  @res = init_api "Genesis"
	  	  @chapter = 50
  	end


	def show
		@books = Book.all
		@book = Book.find(params[:id])
		@chapter = @book.verse
		@res = init_api @book.name
	end

	private

	def init_api (p)
		token = "IP"
	  	passage = URI::encode(p)
	  	options =  ["output-format=html"].join("&")
	  	url = URI.parse("http://www.esvapi.org/v2/rest/passageQuery?key=#{token}&passage=#{passage}&#{options}")
	  	req = Net::HTTP::Get.new(url.to_s)
		Net::HTTP.start(url.host, url.port) {|http|
		    http.request(req)
		}
	end
end
