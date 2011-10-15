class Country < ActiveRecord::Base
  attr_accessible :name, :code, :gold, :silver, :bronze, :game_id
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :game
  has_many :medals
end
