class MedalsController < ApplicationController
  respond_to :json

  def index
    @medals = Medal.all
    respond_with(@medals)
  end
end