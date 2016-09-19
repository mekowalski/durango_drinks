class MicroBreweries::CLI #CLI controller
  def call #class method greeting user then listing breweries
    list_breweries
    brewery_details
    goodbye
  end

  def list_breweries #object named Brewery that scrapes site to return info
    puts "Here are Durango's MicroBreweries"
    puts "
      1. Durango Brewing Co
      2. Ska Brewing Co
      3. Carvers Brewing Co
      4. Animas Brewing Co
      5. Steamworks Brewing Co
      6. Brew Pub & Kitchen
      7. Honeyville Honey
    "
    @brewery = MicroBreweries::Brewery
  end

  def brewery_details #the user will engage to access information on each brewery
    puts "Select a number corresponding to the brewery you're interested in."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More details on Durango Brewing Company"
      when "2"
        puts "More details on Ska Brewing Company"
      when "3"
        puts "More details on Carvers Brewing Company"
      when "list"
        brewery_details
      else
        puts "Not sure what you're looking for. Please retype"
      end
    end
  end

  def goodbye
    puts "Enjoy your Durango Brews!"
  end
end
