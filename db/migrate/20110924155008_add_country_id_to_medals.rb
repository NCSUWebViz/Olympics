class AddCountryIdToMedals < ActiveRecord::Migration
  def change
    add_column :medals, :country_id, :integer
  end
end
