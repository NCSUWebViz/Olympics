class RenameGameIdToOldGameIdInCountries < ActiveRecord::Migration
  def change
    rename_column :countries, :game_id, :old_game_id
  end
end
