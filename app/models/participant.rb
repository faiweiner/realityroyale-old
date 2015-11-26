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

	belongs_to :user, inverse_of: :participants
	belongs_to :league, inverse_of: :participants
	has_many :rounds, inverse_of: :participant, dependent: :destroy

	validates :league_id, presence: true, on: :create
	validates :user_id, presence: true, on: :create
	validates :check_league_capacity, on: :create
	validates_uniqueness_of :user_id, scope: :league_id, on: :create

	# -- Check Capacity -- #
	def check_league_capacity
		# FIXME! Do not allow creation of participation if the league is already full.
	end

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
