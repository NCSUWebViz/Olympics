class RemoveSportSportIdEventOldCountryIdFromMedals < ActiveRecord::Migration
  def change
    remove_column :medals, :sport
    remove_column :medals, :sport_id
    remove_column :medals, :event
    remove_column :medals, :old_country_id
  end
end
