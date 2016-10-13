class DurangoDrinks::CLI #CLI controller
  def call #class method greeting user then listing breweries
    # if DurangoDrinks::Brewery.all.length == 0
      # DurangoDrinks::Brewery.scrape_breweries
      # @breweries = DurangoDrinks::Brewery.all
    # end
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
        DurangoDrinks::Bar.scrape_bars
        DurangoDrinks::Bar.each_with_index(1) do |bar, i|
          puts "#{i}. #{bar.bar_name}"
        end
      when "2"
        puts "Durango's Breweries"
      when "3"
        puts "Durango's Coffeeshops"
        DurangoDrinks::Coffee.all
      when "list"
        list_drink_menu
      when "exit"
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
