class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      
      t.integer :games_count
      t.integer :countries_count
      t.integer :gold_count
      t.integer :silver_count
      t.integer :bronze_count
      t.integer :events_count
      
      t.timestamps
    end
  end
end
