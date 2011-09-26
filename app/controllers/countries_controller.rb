class CountriesController < ApplicationController
  respond_to :html, :json

  def show
    @country = Country.find(params[:id])
    respond_with(@country)
  end
end