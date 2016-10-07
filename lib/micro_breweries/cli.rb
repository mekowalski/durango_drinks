class MicroBreweries::CLI #CLI controller
  def call #class method greeting user then listing breweries
    if MicroBreweries::Brewery.all.length == 0
      MicroBreweries::Brewery.scrape_breweries
      @breweries = MicroBreweries::Brewery.all
    end
    list_breweries
    brewery_details
  end

  def list_breweries #object named Brewery that scrapes site to return info
    puts "Durango's MicroBreweries"
    puts "\n"
    @breweries.each.with_index(1) do |brewery, i|
      puts "#{i}. #{brewery.brewery_name}"
    end
    puts "\n"
  end

  def brewery_details #user will engage to access info on each brewery
    input = nil
    while input != "exit"
      puts "Select the number corresponding to the brewery you're interested in.
        Or type list to see breweries.
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
    puts "Enjoy your Durango Brews!!"
  end
end
