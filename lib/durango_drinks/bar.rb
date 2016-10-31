require 'pry'

class DurangoDrinks::Bar
  attr_accessor :name, :description, :address, :telephone

  LOCATION_TYPES = {bar: "bars-nightlife"}

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_location(location_type = :bar)
    @@all = []
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/bars-nightlife"))
    doc.css(".listing_link").each do |listing|
      name = listing.css("h3").text
      # binding.pry
        self.new({
        :name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text,
      })
    end
  end
end
