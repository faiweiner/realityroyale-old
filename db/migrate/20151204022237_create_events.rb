class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.integer :contestant_id
			t.integer :episode_id
			t.integer :scheme_id
			t.timestamps
		end

		add_index :events, :contestant_id
		add_index :events, :episode_id
		add_index :events, :scheme_id
	end
end