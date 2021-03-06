class CLI

  attr_reader :year

  def call
    year_set
    add_leaders
    list_leaders
    player_details
    bye
  end

  def menu

  end

  def year_set(input = nil)
    if input == nil
      puts "Please enter a year between 1918 and #{Time.new.year} to see the stats leaders for that NHL season"
      input = gets.chomp.to_i
      year_set(input)
    elsif input == 0
      bye
    else
      case input
      when 2005
        puts "There was no 2005 NHL season due to a lockout, please enter a new year between 1918 and #{Time.new.year}"
        input = gets.chomp.to_i
        year_set(input)
      when 1918 .. "#{Time.new.year}".to_i
        @year = input
      else
        puts "Invalid year, please enter a new year between 1918 and #{Time.new.year}"
        input = gets.chomp.to_i
        year_set(input)
      end
    end
  end

  def add_leaders
    LeaderScraper.scrape_leaders("http://www.hockey-reference.com/leagues/NHL_#{self.year}_leaders.html")
  end

  def list_leaders
    puts "------------------------------"
    puts "#{self.year.to_s} NHL Season Leaders:"
    puts "------------------------------"
    puts "Goals: #{LeaderScraper.leaders[0][:goal_leader_name]} - #{LeaderScraper.leaders[0][:goals]}"
    puts "Assists: #{LeaderScraper.leaders[0][:assist_leader_name]} - #{LeaderScraper.leaders[0][:assists]}"
    puts "Points: #{LeaderScraper.leaders[0][:point_leader_name]} - #{LeaderScraper.leaders[0][:points]}"
    puts "------------------------------"

  end

  def player_details
    input = ""
    until input == "exit"
      puts "Enter one of above player's full name for more information about that player, 'menu' for main menu, or 'exit'"
      input = gets.chomp.gsub(" ", "").downcase
      if playerchoice = Player.all.detect {|player| player.downcase_name == input}
        puts "------------------------------"
        puts "#{playerchoice.name}"
        puts "------------------------------"
        puts "Height: #{playerchoice.height}"
        puts "Weight: #{playerchoice.weight}"
        puts "Born in: #{playerchoice.birthyear}"
        puts "------------------------------"
      elsif input == "exit"
        bye
      elsif input == "menu"
        LeaderScraper.clear_leaders
        call
      else
        puts "Invalid name"
      end
    end
  end

  def bye
    puts "See ya later!"
    exit
  end

end
