class Game < ActiveRecord::Base
  attr_accessible :year, :country, :city, :summer, :latitude, :longitude, :meta_url,
    :gold_count, :silver_count, :bronze_count, :countries_count, :sports_count,
    :events_count
  # ---------------------------------------------------------------------------
  geocoded_by :location
  after_validation :geocode
  # ---------------------------------------------------------------------------
  # Associations
  has_many :participations
  has_many :countries, :through => :participations
  # ---------------------------------------------------------------------------
  # Instance Methods
  def location
    self.city + ', ' + self.country
  end
  
  def sport_count(sport)
    count = 0
    self.participations.each do |participation|
      count = count + participation.medals.where(:event_id => sport.event_ids).count
    end
    return count
  end
end
