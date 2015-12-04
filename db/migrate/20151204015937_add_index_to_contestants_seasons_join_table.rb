class AddIndexToContestantsSeasonsJoinTable < ActiveRecord::Migration
	def change
		add_index :contestants_seasons, :contestant_id
		add_index :contestants_seasons, :season_id
	end
end
