require 'pry'
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
      3. Durango Cafes
    """
  end

  def drink_details #user will engage to access info on each brewery
    input = nil
    while input != "exit"
      puts "Select the number corresponding to the drink option you're interested in.
        Or type list to see menu.
        Or type exit."
      input = gets.strip.downcase
      if input == 1
        puts "Durango's Bars"
        DurangoDrinks::Locations.scrape_location(LOCATION_TYPES[:bar])
        DurangoDrinks::Locations.all.each_with_index do |location, i|
          puts "#{i + 1}. #{location.name}"
        end
      # when "2"
        # puts "Durango's Breweries"
        # DurangoDrinks::Brewery.scrape_breweries
        # DurangoDrinks::Brewery.all.each_with_index do |brewery, i|
          # puts "#{i + 1}. #{brewery.name}"
        # end
      # when "3"
        # puts "Durango's Cafes"
        # DurangoDrinks::Cafe.scrape_cafes
        # DurangoDrinks::Cafe.all.each_with_index do |cafe, i|
          # puts "#{i + 1}. #{cafe.name}"
        # end
      elsif input == "list"
        list_drink_menu
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
