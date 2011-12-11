class Event < ActiveRecord::Base
  attr_accessible :name, :games_count, :countries_count, :gold_count,
    :silver_count, :bronze_count
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :sport
  has_many :medals
end
