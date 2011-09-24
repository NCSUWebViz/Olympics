class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :country
      t.string :city
      t.integer :year
      t.string :season
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.string :url
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
