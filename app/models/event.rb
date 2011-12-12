class Event < ActiveRecord::Base
  attr_accessible :name, :games_count, :countries_count, :gold_count,
    :silver_count, :bronze_count
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :sport
  has_many :medals
  
  def self.update_count
    Event.all.each do |event|
      event.gold_count = event.medals.where(:medal => "GOLD").count
      event.silver_count = event.medals.where(:medal => "SILVER").count
      event.bronze_count = event.medals.where(:medal => "BRONZE").count
      event.save
    end
  end
end
