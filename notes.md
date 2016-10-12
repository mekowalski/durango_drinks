def self
  self.scrape_breweries
end

def self.scrape_breweries
  breweries = []
  breweries << self.scrape_site_1
  breweries << self.scrape_site_2
  breweries
ends

def self.scrape_site_1
end

def self.scrape_site_2
end
