class DurangoDrinks::Venue
  attr_accessor :name, :description, :address, :telephone, :location_type
  @@all = []

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @address = attributes[:address]
    @telephone = attributes[:telephone]
    @location_type = attributes[:location_type]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.scrape_location(location, type)
    doc = Nokogiri::HTML(open("http://www.durango.org/listings/category/#{location}"))
    doc.css(".listing_link").each do |listing|
      self.new({
        :name => listing.css("h3").text,
        :description => listing.css(".summary").text,
        :address => listing.css(".address").text.gsub("\n", " "),
        :telephone => listing.css(".phone").text,
        :location_type => type
      })
    end
  end

  def self.find_by_type(type)
    @@all.select { |venue| venue.location_type == type }
  end
end
