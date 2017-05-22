class CLI

  @@year = nil

  def call
    year=
    list_leaders
    player_details
    bye
  end

  def year=
    puts "Enter a year between 1918 and #{Time.new.year} to see the stats leaders for that NHL season (19xx)"
    input = gets.chomp
    if input.between?(1918,"#{Time.new.year}".to_i)
      @@year = gets.chomp
    else
      puts "Invalid year - Please enter a year between 1918 and #{Time.new.year} or exit"
  end

  def year
    @@year
  end

  def scrape_from_year
    Scraper.scrape_main_url("http://www.hockey-reference.com/leagues/NHL_#{self.year}_leaders.html")
  end

  def list_leaders
    puts "Goals: Sidney Crosby"
    puts "Assists: Connor McDavid"
    puts "Points: Connor McDavid"
  end

  def player_details
    puts "Enter player name for more information about that player"
    input = gets.chomp.downcase
    # list player's height, weight, age etc.
  end

  def bye
    puts "SeE ya l8R"
  end

end
