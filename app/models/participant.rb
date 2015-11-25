# == Schema Information
#
# Table name: participants
#
#  id           :integer          not null, primary key
#  league_id    :integer          not null
#  user_id      :integer          not null
#  commissioner :boolean          default(FALSE)
#  score        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

class Participant < ActiveRecord::Base
	belongs_to :user
	belongs_to :league, inverse_of: :participants
	has_many :rounds, inverse_of: :participant, dependent: :destroy

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #

	private

	# ~~ Rounds Creation ~~ #
	def create_rounds
		self.league.season.episodes.each do |episode|
			case self.league.type
			when 'Fantasy'
				puts "fantasy round (episode #{episode}) for league #{self.league.name} for #{self.user.email}!"
			when 'Elimination'
				puts "elimination round (episode #{episode}) for league #{self.league.name} for #{self.user.email}!"
			end
		end
	end
end
