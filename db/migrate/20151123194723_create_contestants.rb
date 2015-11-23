class CreateContestants < ActiveRecord::Migration
	def change
		create_table :contestants do |t|
			t.string 		:name
			t.string 		:image
			t.integer 	:age
			t.string 		:gender
			t.string 		:occupation
			t.text 			:description
			t.boolean 	:active, null: false, default: false
			t.boolean 	:published, null: false, default: false

			t.timestamps
		end
	end
end
