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
      country.save if save
    end
    
    nil
  end

  def self.get_athletes(game_id, country_id)
    # http://nokogiri.org/
    doc = Nokogiri::HTML(open("http://www.databaseolympics.com/country/countryyear.htm?g=#{game_id}&cty=#{country_id}"))
  
    # Country
    doc.css('font.nme b').each do |b|
      puts b.content
    end
  
    # Year, Type and City
    doc.css('font.ind b').each do |b|
      puts b.content
    end
  
    # Athlete name, sport, event, medal and result if available
    doc.css('table.pt8 tr.cl1, table.pt8 tr.cl2').each do |tr|
      year = tr.css('td')[0].content
      sport = tr.css('td')[1].content
      event = tr.css('td')[2].content
      athlete = tr.css('td')[3].content
      result = tr.css('td')[4].content
      medal = tr.css('td')[5].content
      puts <<EOS
      #{athlete}| #{sport} (#{event}) | #{medal} #{result unless result.empty?}
EOS
    end
  end 
end