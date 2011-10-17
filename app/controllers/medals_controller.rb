class MedalsController < ApplicationController
  respond_to :json

  def index
    @medals = Medal.limit(250)
    respond_with(@medals)
  end
end