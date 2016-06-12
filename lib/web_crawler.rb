
require 'nokogiri'
require 'open-uri'

module WebCrawler

	   def self.process_url(url)
			data = Nokogiri::HTML(open(url))
  			parsing_html_data(data)
	   end

	    def self.parsing_html_data(data)
  			item_name = data.at_css('h1.title').text
  			selling_price = data.at_css('.selling-price.omniture-field').attr('data-evar48')
  			discount = data.at_css('.discount.fk-green').nil? ? '' : data.at_css('.discount.fk-green').text
  			emi_starts_from=data.at_css('span.emi-text').nil? ? "" : data.at_css('span.emi-text').text
  			actual_price = data.at_css('span.price').children.text
  			image_url = data.at_css(".productImage.current").attr('data-src')
  			responce_hash = {:titile=>item_name,:price=>selling_price,:discount=>discount,:emi_starts_from=>emi_starts_from,:actual_price=>actual_price,:image=>image_url}

	    end	




end