class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer 	:participant_id, null: false
      t.string 		:type, null: false
      t.integer 	:episode_id, null: false
      t.integer 	:score, default: 0
      t.boolean		:locked, default: false
      
      t.timestamps
    end
  end
end
