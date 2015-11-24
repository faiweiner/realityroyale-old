class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :league_id
      t.integer :user_id
      t.boolean :commissioner, null: false, default: false

      t.timestamps
    end
  end
end
