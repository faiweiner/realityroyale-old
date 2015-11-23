# == Schema Information
#
# Table name: leagues
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  season_id       :integer
#  type            :string(255)
#  participant_cap :integer
#  draft_limit     :integer
#  draft_date      :datetime
#  draft_order     :string(255)
#  league_key      :string(255)
#  league_password :string(255)
#  private         :boolean          default(FALSE), not null
#  active          :boolean          default(FALSE), not null
#  published       :boolean          default(FALSE), not null
#  full            :boolean          default(FALSE), not null
#  locked          :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class League < ActiveRecord::Base
	belongs_to :season, inverse_of: :leagues
	has_and_belongs_to_many :users, inverse_of: :leagues
end
