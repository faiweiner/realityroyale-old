class CreateSchemes < ActiveRecord::Migration
  def change
    create_table :schemes do |t|
      t.integer   :show_id, null: false
      t.string    :type, null: false
      t.string    :description, null: false
      t.integer   :points, null: false, default: 0
      t.boolean   :active, default: false
      t.boolean   :published, default: false

      t.timestamps
    end
  end
end
