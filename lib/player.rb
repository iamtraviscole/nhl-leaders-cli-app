class Player

@@all = []

attr_accessor :name, :downcase_name, :height, :weight, :birthyear

def initialize(url)
  players_doc = Nokogiri::HTML(open(url))
  @downcase_name = players_doc.css(".players h1[itemprop='name']").text.gsub(" ", "").downcase
  @name = players_doc.css(".players h1[itemprop='name']").text
  @height = players_doc.css(".players span[itemprop='height']").text
  @weight = players_doc.css(".players span[itemprop='weight']").text
  @birthyear = players_doc.css(".players span[itemprop='birthDate'] a[2]").text
  @@all << self
end

def self.all
  @@all
end

end
