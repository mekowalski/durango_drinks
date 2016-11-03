require 'pry'
class DurangoDrinks::CLI #CLI controller

  def call
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
        get_drinks('bars-nightlife', 'bar')
      elsif input.to_i == 2
        get_drinks('microbreweries', 'brewery')
      elsif input.to_i == 3
        get_drinks('coffee-shops', 'cafe')
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

  def get_drinks(location, type)
    puts "Durango's #{type}"
    puts "Enter the number corresponding number to a specific #{type} or back for the main menu."
    venues = DurangoDrinks::Venue.find_by_type(type)
    if venues.length == 0
      DurangoDrinks::Venue.scrape_location(location, type)
      venues = DurangoDrinks::Venue.find_by_type(type)
    end
    venues.each.with_index do |venue, i|
      puts "#{i + 1}. #{venue.name}"
    end
    puts "\n"
    input = gets.strip.downcase
    if input != "back"
      venue = venues[input.to_i-1]
      puts "Name:         #{venue.name}"
      puts "Address:      #{venue.address}"
      puts "Description:  #{venue.description}"
      puts "Phone:        #{venue.telephone}"
    end
  end
end
