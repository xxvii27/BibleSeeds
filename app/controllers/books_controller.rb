class BooksController < ApplicationController
	
	def index
		redirect_to :controller=>'books', :action => 'show', :id => 1
  	end


	def show #books/:id
		@books = Book.all
		@book = Book.find(params[:id])
		@chapter = @book.verse
		@res = init_api @book.name
		#@videos = init_youtube @book.name + " 1"
	end

	def  verse #books/:id/:verse_id
		@books = Book.all
		@book = Book.find(params[:id])
	  	@chapter = @book.verse
	  	@res = init_api @book.name + params[:verse_id]
	            #@videos = init_youtube @book.name + params[:verse_id]
	  	render "show"
            end

            def search       #books/search
                        @books = Book.all   
                        name = params[:s_val]
                        book_title = name.split(' ')
                        if book_title.first == '1' || book_title.first == '2' || book_title.first == '3'
                        	bookQuery = book_title.first + " " + book_title[1].downcase.capitalize
                        	@book = Book.find_by name: bookQuery
                        else
                        	@book = Book.find_by name: book_title.first.downcase.capitalize
                        end
                        @chapter = @book.verse
            	@res = init_api params[:s_val]
            	render "show"
            end



	private
	#API Request for ESV Bible
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

	#def init_youtube (s)
 	#	client = YouTubeIt::Client.new(:dev_key => "AI39si6J8mZMoWsEpumZN6p0Q5ST5iWJuaIbwBv2WLhyHv_FuOjYX-ZI7zL92kQXxl_NwgMy0ByxvyInUgpfv5vKGGuA3DJsvA")
 	#	client.videos_by(:query => s, :page => 1, :per_page => 10)
 	#end
end
