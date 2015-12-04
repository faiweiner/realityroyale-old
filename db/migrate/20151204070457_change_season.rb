class ChangeSeason < ActiveRecord::Migration
	def up
		change_column :seasons, :episode_count, :integer, default: 0, null: false
	end
end
