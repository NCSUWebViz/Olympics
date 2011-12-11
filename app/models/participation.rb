class Participation < ActiveRecord::Base
  attr_accessible :game_id, :country_id, :old_country_id, :gold_count, :silver_count, :bronze_count, 
    :sports_count, :events_count
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :game
  belongs_to :country
  has_many :medals
end
