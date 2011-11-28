class SportsController < ApplicationController
  respond_to :html, :json
  
  def index
    @sports = Medal.select(:sport).group(:sport).collect(&:sport)
    respond_with(@sports)
  end

  def show
    @games = Game.select('games.id, game.country, game.city, game.year, game.season, count(medals.id) AS sport_medal_count').group('games.id, game.country, game.city, game.year, game.season, medals.sport').joins(:countries => :medals).where(:medals => {:sport => params[:id]})
    respond_with(@games)
  end
end

//Game(id: integer, country: string, city: string, year: integer, season: string, url: string, created_at: datetime, updated_at: datetime) 