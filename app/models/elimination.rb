# == Schema Information
#
# Table name: leagues
#
#  id                :integer          not null, primary key
#  creator_id        :integer          not null
#  name              :string(255)
#  season_id         :integer
#  type              :string(255)
#  participation_cap :integer
#  draft_limit       :integer
#  draft_date        :datetime
#  draft_order       :string(255)
#  league_key        :string(255)
#  league_password   :string(255)
#  private_access    :boolean          default(FALSE), not null
#  active            :boolean          default(FALSE), not null
#  published         :boolean          default(FALSE), not null
#  full              :boolean          default(FALSE), not null
#  locked            :boolean          default(FALSE), not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Elimination < League
	def self.model_name
		League.model_name
	end
end
