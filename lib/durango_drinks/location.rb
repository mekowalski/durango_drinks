require 'pry'

class DurangoDrinks::Locations
  attr_accessor :name, :description, :address, :telephone, :location_types
  @@all = []

  LOCATION_TYPES = {{bar: "bars-nightlife"}, {cafe: "coffee-shops"}, {brewery: "microbreweries"}}

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @location_type = attributes[:location_types]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_location(location_type)
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category#{LOCATION_TYPES[location_type]}"))
    doc.css(".listing_link").each do |listing|
      name = listing.css("h3").text
        self.new({#instantiates new Brewery object as iterated through web elements
        :name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text,
        :location_type => LOCATION_TYPES[location_type][name]
      })
    end
  end

  def self.find(location_type, input)
    self.all(input.to_i-1)
  end
end
