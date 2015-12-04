class CreateContestantsRoundsJoinTable < ActiveRecord::Migration
	def change
		create_table :contestants_rounds, id: false do |t|
			t.integer :contestant_id
			t.integer :round_id
		end

		add_index :contestants_rounds, :contestant_id
		add_index :contestants_rounds, :round_id
	end
end
