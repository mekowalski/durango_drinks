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
    puts "Durango's Drink Main Menu"
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
      if input.to_i == 1
        puts "Durango's Bars"
        puts "Enter the number corresponding number to a specific bar or back for the main menu."
        DurangoDrinks::Bar.scrape_location(DurangoDrinks::Bar::LOCATION_TYPES[:bar])
        DurangoDrinks::Bar.all.each.with_index do |bar, i|
          puts "#{i + 1}. #{bar.name}"
        end
        puts "\n"
        bar_input = gets.strip.downcase
        if bar_input != "back"
          the_bar = DurangoDrinks::Bar.all[bar_input.to_i-1]
          puts "Name:         #{the_bar.name}"
          puts "Address:      #{the_bar.address}"
          puts "Description:  #{the_bar.description}"
          puts "Phone:        #{the_bar.telephone}"
        end
      elsif input.to_i == 2
        puts "Durango's Breweries"
        puts "Enter the number corresponding number to a specific brewery or back for the main menu."
        DurangoDrinks::Brewery.scrape_location(DurangoDrinks::Brewery::LOCATION_TYPES[:brewery])
        DurangoDrinks::Brewery.all.each.with_index do |brewery, i|
          puts "#{i + 1}. #{brewery.name}"
        end
        puts "\n"
        brewery_input = gets.strip.downcase
        if brewery_input != "back"
          the_brewery = DurangoDrinks::Brewery.all[brewery_input.to_i-1]
          puts "Name:         #{the_brewery.name}"
          puts "Address:      #{the_brewery.address}"
          puts "Description:  #{the_brewery.description}"
          puts "Phone:        #{the_brewery.telephone}"
        end
      elsif input.to_i == 3
        puts "Durango's Cafes"
        puts "Enter the number corresponding number to a specific cafe or back for the main menu."
        DurangoDrinks::Cafe.scrape_location(DurangoDrinks::Cafe::LOCATION_TYPES[:cafe])
        DurangoDrinks::Cafe.all.each.with_index do |cafe, i|
          puts "#{i + 1}. #{cafe.name}"
        end
        puts "\n"
        cafe_input = gets.strip.downcase
        if cafe_input != "back"
          the_cafe = DurangoDrinks::Cafe.all[cafe_input.to_i-1]
          puts "Name:         #{the_cafe.name}"
          puts "Address:      #{the_cafe.address}"
          puts "Description:  #{the_cafe.description}"
          puts "Phone:        #{the_cafe.telephone}"
        end
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
