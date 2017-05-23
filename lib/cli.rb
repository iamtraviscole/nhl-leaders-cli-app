class CLI

  attr_reader :year

  def initialize
    @leaders = []
  end

  def call
    CLI.new
    year_set
    add_leaders
    # make_players
    list_leaders
    player_details
    bye
  end

  def year_set(input = nil)
    if input == nil
      puts "Please enter a year between 1918 and #{Time.new.year} to see the stats leaders for that NHL season"
      input = gets.chomp.to_i
      year_set(input)
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
    @leaders << Scraper.scrape_leaders("http://www.hockey-reference.com/leagues/NHL_#{self.year}_leaders.html")
    # @leaders << Scraper.scrape_leaders
  end

  def make_players
    base_url = "http://www.hockey-reference.com"
    Player.new(base_url + @leaders[0][:goal_leader_url])
    Player.new(base_url + @leaders[0][:assist_leader_url])
    Player.new(base_url + @leaders[0][:points_leader_url])
  end

  def list_leaders
    puts "#{self.year.to_s} NHL Season Leaders:"
    puts "Goals: #{@leaders[0][:goal_leader_name]} - #{@leaders[0][:goals]}"
    puts "Assists: #{@leaders[0][:assist_leader_name]} - #{@leaders[0][:assists]}"
    puts "Points: #{@leaders[0][:point_leader_name]} - #{@leaders[0][:points]}"

  end

  def player_details
    puts "Enter one of the player name's above for more information about that player"
    input = gets.chomp.gsub(" ", "").downcase
    # list player's height, weight, age etc.
  end

  def bye
    puts "SeE ya l8R"
  end

end
