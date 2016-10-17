class DurangoDrinks::CLI #CLI controller
  def call
    list_drink_menu
    drink_details
  end

  def list_drink_menu
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
      case input
      when "1"
        puts "Durango's Bars"
        collection = DurangoDrinks::BarCollection.new
      when "2"
        puts "Durango's Breweries"
        collection = DurangoDrinks::BreweryCollection.new
      when "3"
        puts "Durango's Coffee Shops"
        collection = DurangoDrinks::CoffeeCollection.new
      when "list"
        list_drink_menu
      when "exit"
        goodbye
      else
        puts "What are you looking for? Please retype list or exit."
      end
      collection.print_listings
    end
  end

  def goodbye
    puts "Enjoy your Durango Drinks!!"
  end
end
