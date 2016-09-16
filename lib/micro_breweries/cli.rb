class MicroBreweries::CLI
  def call
    puts "Here are Durango's MicroBreweries"
    list_breweries
  end

  def list_breweries
    puts """
      1. Durango Brewing Co
      2. Ska Brewing Co
      3. Carvers Brewing Co
      4. Animas Brewing Co
      5. Steamworks Brewing Co
      6. Brew Pub & Kitchen
      7. Honeyville Honey
    """
  end
end
