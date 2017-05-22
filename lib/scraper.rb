class Scraper

 def scrape_main_url(url)
   # scrape main page and return a hash containing goals_leader => name, assists_leader => name, etc.
   main_doc = Nokogiri::HTML(open(url))
   leaders = {}
   leaders[:goals] = #scraped data
   leaders[:assists] = #scraped data
   leaders[:points] = #scraped data
   leaders
 end

end
