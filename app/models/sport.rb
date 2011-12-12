class Sport < ActiveRecord::Base
  attr_accessible :name, :games_count, :countries_count, :gold_count,
    :silver_count, :bronze_count, :events_count
  # ---------------------------------------------------------------------------
  # Associations
  has_many :events
  has_many :medals, :through => :events
  
  def self.update_count
    Sport.all.each do |sport|
      sport.gold_count = sport.events.collect(&:gold_count).sum
      sport.silver_count = sport.events.collect(&:silver_count).sum
      sport.bronze_count = sport.events.collect(&:bronze_count).sum
      event.save
    end
  end
end
