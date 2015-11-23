class CreateTableCommissionersLeagues < ActiveRecord::Migration
	def change
		create_table :commissioners_leagues, id: false do |t|
			t.integer		:league_id
			t.integer		:user_id
		end
	end
end
