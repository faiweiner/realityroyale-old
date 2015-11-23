class CreateJoinTableContestantsSeasons < ActiveRecord::Migration
	def change
		create_join_table :contestants, :seasons, id: false do |t|
			t.integer :contestant_id
			t.integer :season_id
			t.string 	:status
			t.boolean	:active, default: true
		end
	end
end
