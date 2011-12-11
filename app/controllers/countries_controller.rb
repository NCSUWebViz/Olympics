class CountriesController < ApplicationController
  respond_to :html, :json

  def index
    @countries = Country.order(:long_name)
    respond_with(@countries)
  end

  def show
    @country = Country.find(params[:id])
    respond_with(@country)
  end
end