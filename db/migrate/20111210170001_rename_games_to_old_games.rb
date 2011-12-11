class RenameGamesToOldGames < ActiveRecord::Migration
  def change
      rename_table :games, :old_games
  end
end
