class Scraper

 def self.scrape_leaders
   # scrape main page and return a hash containing goals_leader => name, assists_leader => name, etc.
  #  main_doc = Nokogiri::HTML(open(url))
  #  card.css("#leaders_goals .first_place .who a").text
  leaders = {}
   leaders[:goal_leader_name] = "player1"
   leaders[:goal_leader_url] = "url1"
   leaders[:goals] = "50"
   leaders[:assist_leader_name] = "player2"
   leaders[:assist_leader_url] = "url2"
   leaders[:assists] = "60"
   leaders[:point_leader_name] = "player3"
   leaders[:assist_leader_url] = "url3"
   leaders[:points] = "100"

   Player.new(leaders[:goal_leader_url])
   Player.new(leaders[:assist_leader_url])
   Player.new(leaders[:points_leader_url])
   
   leaders
 end

end
