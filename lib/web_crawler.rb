
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
    emi_starts_from = data.at_css('span.emi-text').nil? ? '' : data.at_css('span.emi-text').text
    actual_price = data.at_css('span.price').children.text
    image_url = data.at_css('.productImage.current').attr('data-src')
    sub_titile = data.at_css('subtitle').nil? ? '' : data.at_css('subtitle').text
    key_specifications = get_key_specifications(data)

    responce_hash = {
      titile: item_name,
      price: selling_price,
      discount: discount,
      emi_starts_from: emi_starts_from,
      actual_price: actual_price, image: image_url,
      key_specifications: key_specifications,
      subtitle: sub_titile
    }
   end

  def self.get_key_specifications(data)
    sp_array = []

    data.css('.key-specification').each do |sp|
      sp_array << sp.text unless sp.nil?
    end
    sp_array
  end

end
