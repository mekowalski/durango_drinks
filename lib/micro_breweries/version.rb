class MicroBreweries::Brewery
  attr_accessor :brewery_name, :description, :telephone, :address

  def self
    self.scrape_breweries
  end

  def self.scrape_breweries

end
