class CreateLeagues < ActiveRecord::Migration
	def change
		create_table :leagues do |t|
			t.integer		:creator_id, null: false
			t.string 		:name
			t.integer 	:season_id
			t.string 		:type
			t.integer 	:participation_cap
			t.integer 	:draft_limit
			t.datetime 	:draft_date
			t.string 		:draft_order
			t.string 		:league_key
			t.string 		:league_password
			t.boolean 	:private_access, null: false, default: false
			t.boolean 	:active, null: false, default: false
			t.boolean 	:published, null: false, default: false
			t.boolean 	:full, null: false, default: false
			t.boolean 	:locked, null: false, default: false

			t.timestamps
		end
	end
end
