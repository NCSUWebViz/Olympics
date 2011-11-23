class CountriesController < ApplicationController
  respond_to :html, :json

  def index
    @countries = Country.all.group_by(&:name)
    respond_with(@countries)
  end

  def show
    @country = Country.find(params[:id])
    respond_with(@country)
  end
end