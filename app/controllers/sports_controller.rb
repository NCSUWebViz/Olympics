class SportsController < ApplicationController
  respond_to :html, :json
  
  def index
    @sports = Medal.select(:sport).group(:sport).collect(&:sport)
    respond_with(@sports)
  end

  def show
    @games = Game.select('games.*, count(medals.id) AS sport_medal_count').group('games.id, games.country, games.city, games.year, games.season, games.url, games.created_at, games.updated_at, medals.sport').joins(:countries => :medals).where(:medals => {:sport => params[:id]})
    respond_with(@games)
  end
end