class Player

@@all = []

attr_reader :name, :height, :weight, :birthdate

def initialize(url)
  players_doc = Nokogiri::HTML(open(url))
  @name = players_doc.css(".players h1[itemprop='name']").text.gsub(" ", "").downcase
  @height = players_doc.css(".players span[itemprop='height']").text
  @weight = players_doc.css(".players span[itemprop='weight']").text
  @birthdate = players_doc.css(".players span[itemprop='birthDate'] a[2]").text
  @@all << self
end

end
