class DurangoDrinks::CLI #CLI controller
  def call #class method greeting user then listing breweries
    # if DurangoDrinks::Brewery.all.length == 0
      # DurangoDrinks::Brewery.scrape_breweries
      # @breweries = DurangoDrinks::Brewery.all
    # end
    list_drink_options
    drink_details
  end

  def list_drink_options #object named Brewery that scrapes site to return info
    puts "Durango's Drink Options"
    puts """
      1. Durango Bars
      2. Durango Breweries
      3. Durango Coffeeshops
    """
  end

  def drink_details #user will engage to access info on each brewery
    input = nil
    while input != "exit"
      puts "Select the number corresponding to the drink option you're interested in.
        Or type list to see menu.
        Or type exit."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= @breweries.count
        brewery = @breweries[input.to_i - 1]
        puts "\n"
        puts "Brewery: #{brewery.brewery_name}"
        puts "Description: #{brewery.description}"
        puts "Address: #{brewery.address}"
        puts "Telephone: #{brewery.telephone}"
        puts "\n"
      elsif input == "list"
        list_breweries
      elsif input == "exit"
        goodbye
      else
        puts "What are you looking for? Please retype list or exit."
      end
    end
  end

  def goodbye
    puts "Enjoy your Durango Drinks!!"
  end
end
