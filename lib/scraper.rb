class Scraper

  # Should i refactor into a Leader class??

  BASE_PATH = "http://www.hockey-reference.com"

  def self.scrape_leaders(url)
    leader_doc = Nokogiri::HTML(open(url))

    leaders = {}
    leaders[:goal_leader_name] = leader_doc.css("div#leaders_goals .first_place .who a").text.strip
    leaders[:goal_leader_url] = BASE_PATH + leader_doc.css("div#leaders_goals .first_place .who a[href]").first["href"]
    leaders[:goals] = leader_doc.css("div#leaders_goals .first_place .value").text.strip
    leaders[:assist_leader_name] = leader_doc.css("div#leaders_assists .first_place .who a").text.strip
    leaders[:assist_leader_url] = BASE_PATH + leader_doc.css("div#leaders_assists .first_place .who a[href]").first["href"]
    leaders[:assists] = leader_doc.css("div#leaders_assists .first_place .value").text.strip
    leaders[:point_leader_name] = leader_doc.css("div#leaders_points .first_place .who a").text.strip
    leaders[:point_leader_url] = BASE_PATH + leader_doc.css("div#leaders_points .first_place .who a[href]").first["href"]
    leaders[:points] = leader_doc.css("div#leaders_points .first_place .value").text.strip

    leaders
  end

end
