class SportsController < ApplicationController
  respond_to :html, :json
  
  def index
    @sports = Medal.select(:sport).group(:sport).collect(&:sport)
    respond_with(@sports)
  end

  def show
    @games = Game.select('games.*, count(medals.id) AS sport_medal_count').group('games.id, medals.sport').joins(:countries => :medals).where(:medals => {:sport => params[:id]})
    respond_with(@games)
  end
end