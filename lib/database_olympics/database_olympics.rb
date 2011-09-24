require 'open-uri'

class DatabaseOlympics
  def self.get_country_totals(game_id, save = true)
    game = Game.new
    game.url = "http://www.databaseolympics.com/games/gamesyear.htm?g=#{game_id}"
    doc = Nokogiri::HTML(open(game.url))
  
    # Year and Season
    doc.css('font.nme b').each do |b|
      year_season = b.content
      game.year = year_season.slice!(0..3)
      game.season = year_season.strip
    end
  
    # City, Country
    doc.css('td font.ind b').each do |b|
      game.city, game.country = b.content.split(', ')
    end
  
    game.save if save
  
    # Country and medal totals
    doc.css('table.pt8 tr.cl2').each do |tr|
      country = game.countries.new
      country.name = tr.css('td')[0].content
      url = tr.css('td')[0].css('a')[0].attribute('href').to_s
      country.code = url.slice((url.length - 3)..url.length)
      country.gold = tr.css('td')[1].content
      country.silver = tr.css('td')[2].content
      country.bronze = tr.css('td')[3].content
      if save
        country.save
        DatabaseOlympics.get_athletes(game.id, country)
      end
    end
    
    nil
  end

  def self.get_athletes(game_id, country)
    # http://nokogiri.org/
    doc = Nokogiri::HTML(open("http://www.databaseolympics.com/country/countryyear.htm?g=#{game_id}&cty=#{country.code}"))
  
    # Athlete name, sport, event, medal and result if available
    doc.css('table.pt8 tr.cl1, table.pt8 tr.cl2').each do |tr|
      medal = country.medals.new
      medal.sport = tr.css('td')[1].content
      medal.event = tr.css('td')[2].content
      medal.athlete = tr.css('td')[3].content
      medal.result = tr.css('td')[4].content
      medal.medal = tr.css('td')[5].content
      medal.save
    end
  end 
end