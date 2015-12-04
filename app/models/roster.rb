# == Schema Information
#
# Table name: rounds
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  type           :string(255)      not null
#  episode_id     :integer          not null
#  score          :integer          default(0)
#  locked         :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#

class Roster < Round

	# FIXME! Not DRY
	def self.model_name
		Round.model_name
	end
end
