class RenameCountriesToOldContries < ActiveRecord::Migration
  def change
      rename_table :countries, :old_countries
      rename_column :medals, :country_id, :old_country_id
  end
end
