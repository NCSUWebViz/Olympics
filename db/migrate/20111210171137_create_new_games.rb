class CreateNewGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :year
      t.string :country
      t.string :city
      t.float :latitude
      t.float :longitude
      t.boolean :summer

      t.string :meta_url
      
      t.integer :gold_count
      t.integer :silver_count
      t.integer :bronze_count
      t.integer :countries_count
      t.integer :sports_count
      t.integer :events_count
      
      t.timestamps
    end
  end
end
