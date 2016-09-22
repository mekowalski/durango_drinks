# require 'pry'

class MicroBreweries::Brewery
  attr_accessor :brewery_name, :description, :address, :telephone
  @@all = []

  def initialize(attributes = {})
    @brewery_name = attributes[:brewery_name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_breweries
    @@all = []
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/microbreweries"))
    doc.css(".listing_link").each do |listing|
      brewery_name = listing.css("h3").text
        self.new({
        :brewery_name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.strip,
        :telephone => listing.css(".phone").text
      })
    end
  end
end
