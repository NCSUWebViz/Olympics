class ParticipationsController < ApplicationController
  respond_to :html, :json

  def index
    # if params[:code].present? and params[:year].present?
    #       @country = Country.joins(:game).where(:code => params[:code], :games => {:year => params[:year]}).try(:first)
    #       raise ActiveRecord::RecordNotFound if @country.nil?
    #       redirect_to country_path(@country, :format => 'json')
    #       return
    #     end 
    
    @participations = Participation.all
    respond_with(@participations)
  end

  def show
    @participation = Participation.find(params[:id])
    respond_with(@participation)
  end
end