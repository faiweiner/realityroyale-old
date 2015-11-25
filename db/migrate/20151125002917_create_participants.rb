class CreateParticipants < ActiveRecord::Migration
	def change
		create_table :participants do |t|
			t.integer 	:league_id, null: false
			t.integer 	:user_id, null: false
			t.boolean 	:commissioner, default: false
			t.boolean		:favorite, default: false
			t.integer 	:score, default: 0
			t.timestamps
		end
	end
end
