class MoveMedalTotalsFromGamesToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :gold, :integer
    add_column :countries, :silver, :integer
    add_column :countries, :bronze, :integer
    
    remove_column :games, :gold
    remove_column :games, :silver
    remove_column :games, :bronze
  end
end
