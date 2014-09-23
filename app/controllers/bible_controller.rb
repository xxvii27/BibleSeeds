class BibleController < ApplicationController
  def index
  	token = "1db19f32ecde9ea8"
  	passage = URI::encode('john 3:10')
  	options =  ["output-format=crossway-xml-1.0"].join("&")
  	url = URI.parse("http://www.esvapi.org/v2/rest/passageQuery?key=#{token}&passage=#{passage}&#{options}")
  	req = Net::HTTP::Get.new(url.to_s)
	res = Net::HTTP.start(url.host, url.port) {|http|
	  http.request(req)
	}
	@content = Nokogiri::XML(res.body)
	@verse = @content.xpath("//reference").text
	@message = @content.xpath("//verse-unit")
	@message .each do |m|
		@num = m.xpath("verse-num").text
		# Remove footnotes
		 m.xpath("woc").xpath('footnote').remove
		@word = m.xpath("woc").text

	end

	



  end
end