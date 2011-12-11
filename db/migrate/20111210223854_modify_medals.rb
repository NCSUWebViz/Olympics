class ModifyMedals < ActiveRecord::Migration
  def change
    add_column :medals, :participation_id, :integer
    add_column :medals, :sport_id, :integer
    add_column :medals, :event_id, :integer
  end
end