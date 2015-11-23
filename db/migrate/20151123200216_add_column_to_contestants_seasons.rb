class AddColumnToContestantsSeasons < ActiveRecord::Migration
  def change
    add_column :contestants_seasons, :status, :string
  end
end
