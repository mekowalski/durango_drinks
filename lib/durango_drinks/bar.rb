class DurangoDrinks::Bar
  attr_accessor :bar_name, :description, :address, :telephone
  @@all = []

  def initialize(attributes = {})
    @bar_name = attributes[:bar_name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_bars
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/bars-nightlife"))
    doc.css(".listing_link").each do |listing|
      bar_name = listing.css("h3").text
        self.new({#instantiates new Brewery object as iterated through web elements
        :bar_name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text
      })
    end
  end
end
