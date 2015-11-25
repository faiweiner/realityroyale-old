class AddFavoriteToParticipant < ActiveRecord::Migration
	def change
		add_column :participants, :favorite, :boolean, default: false
	end
end
