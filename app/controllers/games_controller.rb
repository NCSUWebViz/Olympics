class GamesController < ApplicationController
  respond_to :html, :json
  
  def index
    @games = Game.all
    respond_with(@games)
  end

  def show
    @game = Game.find(params[:id])
    respond_with(@game)
  end
end