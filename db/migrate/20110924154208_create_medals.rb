class CreateMedals < ActiveRecord::Migration
  def self.up
    create_table :medals do |t|
      t.string :sport
      t.string :event
      t.string :athlete
      t.string :result
      t.string :medal
      
      t.timestamps
    end
  end

  def self.down
    drop_table :medals
  end
end
