class Medal < ActiveRecord::Base
  attr_accessible :athlete, :result, :medal, :participation_id, :event_id
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :participation
  belongs_to :event
  belongs_to :old_country
  
  scope :gold, where(:medal => "GOLD")
  scope :silver, where(:medal => "SILVER")
  scope :bronze, where(:medal => "BRONZE")  
end