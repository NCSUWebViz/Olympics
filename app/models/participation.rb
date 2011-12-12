class Participation < ActiveRecord::Base
  attr_accessible :game_id, :country_id, :old_country_id, :gold_count, :silver_count, :bronze_count, 
    :sports_count, :events_count
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :game
  belongs_to :country
  has_many :medals
  
  scope :summer, joins(:game).where(:games => {:summer => true});
  scope :winter, joins(:game).where(:games => {:summer => false});
  
  def self.update_count
    Participation.all.each do |participation|
      participation.gold_count = participation.medals.where(:medal => "GOLD").count
      participation.silver_count = participation.medals.where(:medal => "SILVER").count
      participation.bronze_count = participation.medals.where(:medal => "BRONZE").count
      participation.save
    end
  end
end
