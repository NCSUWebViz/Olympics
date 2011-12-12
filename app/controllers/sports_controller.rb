class SportsController < ApplicationController
  respond_to :html, :json
  
  def index
    @sports = Sport.all
    respond_with(@sports)
  end

  def show
    @sport = Sport.find(params[:id])
    @games = Game.all
    respond_with(@games)
  end
end