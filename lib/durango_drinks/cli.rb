class DurangoDrinks::CLI #CLI controller
  def call
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
        DurangoDrinks::Bar.all.each_with_index do |bar, i|
          puts "#{i + 1}. #{bar.name}"
        end
      when "2"
        puts "Durango's Breweries"
        DurangoDrinks::Brewery.scrape_breweries
        DurangoDrinks::Brewery.all.each_with_index do |brewery, i|
          puts "#{i + 1}. #{brewery.name}"
        end
      when "3"
        puts "Durango's Coffee Shops"
        DurangoDrinks::Coffee.scrape_coffeeshops
        DurangoDrinks::Coffee.all.each_with_index do |coffee, i|
          puts "#{i + 1}. #{coffee.name}"
        end
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
