# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  season_id      :integer          not null
#  air_date       :datetime
#  survivor_count :integer
#  published      :boolean          default(FALSE), not null
#  aired          :boolean          default(FALSE), not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Episode < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules
	
	belongs_to :season, inverse_of: :episodes
	has_many :rounds, inverse_of: :episode
	has_many :events, inverse_of: :contestant
	
	after_save :update_season_episode_count

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private

	def update_season_episode_count
		# Only executes AFTER an episode has been created
		current_count = self.season.episodes.count if self.season.episodes.count > 0
		attribute_count = self.season.episode_count

		# If the number of recorded episodes exceed season's episode_count attribute
		if current_count && current_count > attribute_count
			self.season.update!(episode_count: current_count)
		end
	end
end
