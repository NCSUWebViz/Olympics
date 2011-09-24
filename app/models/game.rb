class Game < ActiveRecord::Base
  attr_accessible :country, :city, :year, :season, :url
  # ---------------------------------------------------------------------------
  # Associations
  has_many :countries
  has_many :athletes, :through => :countries
  # ---------------------------------------------------------------------------
  # Class Methods
  def self.retreive(game_id, save = true)
    DatabaseOlympics.get_country_totals(game_id, save)
  end
end
