class Country < ActiveRecord::Base
  attr_accessible :long_name, :latitude, :longitude, :summer_games_count, 
    :summer_gold_count, :summer_silver_count, :summer_bronze_count, 
    :summer_sports_count, :summer_events_count, :winter_games_count, :winter_gold_count,
    :winter_silver_count, :winter_bronze_count, :winter_sports_count, :winter_events_count
  # ---------------------------------------------------------------------------
  geocoded_by :name
  after_validation :geocode
  # ---------------------------------------------------------------------------
  # Associations
  has_many :participations
  
  def name
    self.long_name.sub(/ (.*)/, '')
  end
end
