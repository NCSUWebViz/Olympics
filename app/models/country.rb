class Country < ActiveRecord::Base
  attr_accessible :name, :code, :gold, :silver, :bronze, :game_id
  # ---------------------------------------------------------------------------
  geocoded_by :country_name
  after_validation :geocode
  # Associations
  belongs_to :game
  has_many :medals
  
  def country_name
    self.name.sub(/ (.*)/, '')
  end
end
