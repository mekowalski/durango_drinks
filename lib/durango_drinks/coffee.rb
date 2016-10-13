class DurangoDrinks::Coffee
  attr_accessor :coffee_name, :description, :address, :telephone
  @@all = []

  def initialize(attributes = {})
    @coffee_name = attributes[:coffee_name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_coffeeshops
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/coffee-shops"))
    doc.css(".listing_link").each do |listing|
      coffee_name = listing.css("h3").text
        self.new({#instantiates new Brewery object as iterated through web elements
        :coffee_name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text
      })
    end
  end
end
