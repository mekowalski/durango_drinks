class DurangoDrinks::ListingCollection
  attr_reader :listings

  def initialize
    scrape
  end
  
  def scrape(url)
    @listings = []
    doc = Nokogiri::HTML(open(url))
    doc.css(".listing_link").each do |listing|
      @listings << DurangoDrinks::Listing.new({
        listing.css("h3").text,
        listing.css(".summary").text,
        listing.css(".address").text.gsub("\n", " "),
        listing.css(".phone").text
      })
    end
  end

  def print_listings
    @listings.each_with_index do |listing, i|
      puts "#{i + 1}. #{listing.name}"
    end
  end

end
