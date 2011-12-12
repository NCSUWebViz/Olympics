class ParticipationsController < ApplicationController
  respond_to :html, :json

  def index
    @participations = Participation.all
    respond_with(@participations)
  end

  def show
    @participation = Participation.find(params[:id])
    @sports = @participation.medals.includes(:event => :sport).group_by {|medals| medals.event.sport.name }
    unless params[:sport_id].nil?
      @sport = Sport.find(params[:sport_id])
      @events = @participation.medals.includes(:event).joins(:event).where('events.sport_id = ?', @sport.id).group_by {|medals| medals.event.name }
    end
    respond_with(@participation)
  end
end