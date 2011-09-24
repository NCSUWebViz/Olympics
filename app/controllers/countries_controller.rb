class CountriesController < ApplicationController
  respond_to :html

  def show
    @country = Country.find(params[:id])
  end
end