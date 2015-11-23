class CreateEpisodes < ActiveRecord::Migration
	def change
		create_table :episodes do |t|
			t.integer 	:season_id, null: false
			t.datetime 	:air_date
			t.integer 	:survivor_count
			t.boolean 	:published, null: false, default: false
			t.boolean 	:aired, null: false, default: false

			t.timestamps
		end
	end
end
