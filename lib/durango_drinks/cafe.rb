class DurangoDrinks::Cafe
  attr_accessor :name, :description, :address, :telephone
  @@all = []

  LOCATION_TYPES = {cafe: "coffee-shops"}

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

  def self.scrape_location(location_type = :cafe)
    @@all = []
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/coffee-shops"))
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
