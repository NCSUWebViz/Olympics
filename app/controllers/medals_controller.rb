class MedalsController < ApplicationController
  respond_to :json

  def index
    @medals = Medal.joins(:country)
    if params[:country] && params[:athlete]
      @medals = @medals.where(:countries => {:name => params[:athlete]}, :athlete => params[:athlete]) if params[:country] && params[:athlete]
    else
      @medals = @medals.limit(250)
    end
      
    respond_with(@medals)
  end
end