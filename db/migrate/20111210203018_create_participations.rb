class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :game
      t.references :country
      
      t.integer :gold_count
      t.integer :silver_count
      t.integer :bronze_count
      t.integer :sports_count
      t.integer :events_count
      
      t.timestamps
    end
  end
end
