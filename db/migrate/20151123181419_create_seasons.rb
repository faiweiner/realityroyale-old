class CreateSeasons < ActiveRecord::Migration
	def change
		create_table :seasons do |t|
			t.string    :name
			t.integer   :number
			t.integer   :show_id
			t.integer   :country_origin
			t.string    :type
			t.text      :description
			t.string    :image
			t.string    :website
			t.integer   :network
			t.datetime  :premiere_date
			t.datetime  :finale_date
			t.integer   :episode_count
			t.boolean   :active, default: false
			t.boolean   :published, default: false

			t.timestamps  null: false
		end
	end
end
