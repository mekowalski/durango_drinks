class DurangoDrinks::Brewery
  attr_accessor :name, :description, :address, :telephone
  @@all = []

  LOCATION_TYPES = {brewery: "microbreweries"}

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

  def self.scrape_location(location_type = :brewery)
    @@all = []
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/microbreweries"))
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
