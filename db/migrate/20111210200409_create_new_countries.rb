class CreateNewCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :long_name
      t.float :latitude
      t.float :longitude
      
      t.integer :summer_games_count
      t.integer :summer_gold_count
      t.integer :summer_silver_count
      t.integer :summer_bronze_count
      t.integer :summer_sports_count
      t.integer :summer_events_count
      
      t.integer :winter_games_count
      t.integer :winter_gold_count
      t.integer :winter_silver_count
      t.integer :winter_bronze_count
      t.integer :winter_sports_count
      t.integer :winter_events_count
      
      t.timestamps
    end
  end
end
