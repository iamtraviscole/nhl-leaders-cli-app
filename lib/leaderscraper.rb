class LeaderScraper

  @@leaders = []

  BASE_PATH = "http://www.hockey-reference.com"

  def self.scrape_leaders(url)
    leader_doc = Nokogiri::HTML(open(url))

    leaders_urls = {}
    leaders_urls[:goal_leader_url] = BASE_PATH + leader_doc.css("div#leaders_goals .first_place .who a[href]").first["href"]
    leaders_urls[:assist_leader_url] = BASE_PATH + leader_doc.css("div#leaders_assists .first_place .who a[href]").first["href"]
    leaders_urls[:point_leader_url] = BASE_PATH + leader_doc.css("div#leaders_points .first_place .who a[href]").first["href"]

    leaders_data = {}
    leaders_data[:goal_leader_name] = leader_doc.css("div#leaders_goals .first_place .who a").first.text.strip
    leaders_data[:goals] = leader_doc.css("div#leaders_goals .first_place .value").first.text.strip
    leaders_data[:assist_leader_name] = leader_doc.css("div#leaders_assists .first_place .who a").first.text.strip
    leaders_data[:assists] = leader_doc.css("div#leaders_assists .first_place .value").first.text.strip
    leaders_data[:point_leader_name] = leader_doc.css("div#leaders_points .first_place .who a").first.text.strip
    leaders_data[:points] = leader_doc.css("div#leaders_points .first_place .value").first.text.strip

    Player.new("#{leaders_urls[:goal_leader_url]}")
    Player.new("#{leaders_urls[:assist_leader_url]}")
    Player.new("#{leaders_urls[:point_leader_url]}")

    LeaderScraper.save_leader_data(leaders_data)
  end

  def self.leaders
    @@leaders
  end

  def self.save_leader_data(leader_hash)
    @@leaders << leader_hash
  end

  def self.clear_leaders
    @@leaders.clear
  end

end
