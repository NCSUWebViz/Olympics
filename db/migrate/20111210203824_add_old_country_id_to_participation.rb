class AddOldCountryIdToParticipation < ActiveRecord::Migration
  def change
    add_column :participations, :old_country_id, :integer
  end
end
