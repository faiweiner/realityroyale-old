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
#  favorite     :boolean          default(FALSE)
#

class Participant < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules

	belongs_to 		:user, inverse_of: :participants
	belongs_to 		:league, inverse_of: :participants
	has_many 			:rounds, inverse_of: :participant, dependent: :destroy

	after_save 		:create_rounds

	validates 		:league_id, presence: true, on: :create
	validates 		:user_id, presence: true, on: :create
	validate 			:check_league_capacity, on: :create
	validates_uniqueness_of :user_id, scope: :league_id, on: :create

	# -- Check Capacity -- #
	def check_league_capacity
		league = League.find(self.league_id)
		# FIXME! Do not allow creation of participation if the league is already full.
		errors.add(:league_id, "League is full and cannot be joined.") if league.check_capacity == 'full'
	end

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #

	private

	# ~~ Rounds Creation ~~ #
	def create_rounds
		# check if the season has any episodes to warrant an episode count
		episode_count = self.league.season.episode_count
		unless episode_count.nil?	# skip this block if episode_count is nil
			self.league.season.episodes.each do |episode|
				league_type = nil
				case self.league.type 
				when 'Fantasy'; league_type = 'Roster'
				when 'Elimination'; league_type = 'Bracket'
				end
				round_params = {participant_id: self.id, type: league_type, episode_id: episode.id}
				puts round_params
				round = Round.create(round_params)
			end
		end
	end
end








