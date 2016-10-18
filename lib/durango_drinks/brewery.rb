class DurangoDrinks::Brewery
  attr_accessor :name, :description, :address, :telephone
  @@all = []

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

  def self.scrape_breweries
    @@all = []
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/microbreweries"))
    doc.css(".listing_link").each do |listing|
      name = listing.css("h3").text
        self.new({#instantiates new Brewery object as iterated through web elements
        :name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text
      })
    end
  end
end


# MicroBreweries::Brewery.breweries('durango') #=> [ <#3423424324242342 @brewery_name = ,etc. > <#232423242342, @city=]
# MicroBreweries::Brewery.breweries('dolores')

# MicroBreweries::Scraper.scrape("http://www.durango.org/listings/category/microbreweries")

# bars: bars-nightlife
# breweries: microbreweries
# coffee: coffee-shops
