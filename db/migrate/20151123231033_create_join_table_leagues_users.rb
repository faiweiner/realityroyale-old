class CreateJoinTableLeaguesUsers < ActiveRecord::Migration
  def change
  	create_table :leagues_users, id: false do |t|
			t.integer		:league_id
			t.integer		:user_id
			t.boolean		:commissioner, default: false
		end
  end
end
