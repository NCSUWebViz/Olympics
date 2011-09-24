class Medal < ActiveRecord::Base
  attr_accessible :sport, :event, :athlete, :result, :medal, :country_id
  # ---------------------------------------------------------------------------
  # Associations
  belongs_to :countries
end