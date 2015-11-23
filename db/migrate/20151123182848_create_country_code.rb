class CreateCountryCode < ActiveRecord::Migration
	def change
		create_table :country_codes do |t|
			t.string    :name, null: false
		end
	end
end
