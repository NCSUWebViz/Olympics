class GamesController < ApplicationController
  respond_to :html
  
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end
end