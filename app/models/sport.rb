class Sport < ActiveRecord::Base
  attr_accessible :name, :games_count, :countries_count, :gold_count,
    :silver_count, :bronze_count, :events_count
  # ---------------------------------------------------------------------------
  # Associations
  has_many :events
  has_many :medals, :through => :events
end
