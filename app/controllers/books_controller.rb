class BooksController < ApplicationController
	
	def index
		redirect_to :controller=>'books', :action => 'show', :id => 1
  	end


	def show
		@books = Book.all
		@book = Book.find(params[:id])
		@chapter = @book.verse
		@res = init_api @book.name
	end

	def  verse
		@books = Book.all
		@book = Book.find(params[:id])
	  	@chapter = @book.verse
	  	@res = init_api @book.name + params[:verse_id]
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
