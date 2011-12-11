class OldGame < ActiveRecord::Base
  attr_accessible :old_country, :city, :year, :season, :url
  # ---------------------------------------------------------------------------
  # Associations
  has_many :old_countries
  has_many :athletes, :through => :old_countries
  has_many :medals, :through => :old_countries
  # ---------------------------------------------------------------------------
  # Class Methods
  def self.retreive(game_id, save = true)
    DatabaseOlympics.get_country_totals(game_id, save)
  end
end
