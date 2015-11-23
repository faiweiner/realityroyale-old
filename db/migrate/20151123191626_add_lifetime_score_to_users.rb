class AddLifetimeScoreToUsers < ActiveRecord::Migration
	def change
		add_column :users, :lifetime_score, :integer
	end
end
