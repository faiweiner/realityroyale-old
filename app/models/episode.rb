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
	
	belongs_to :season
	has_many :rounds, inverse_of: :episode
	has_many :events, inverse_of: :contestant
	
	after_save :update_season_episode_count

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private

	def save_shout
	end

	def update_season_episode_count
		current_count = self.season.episodes.count
		attribute_count = self.season.episode_count
		if current_count != attribute_count
			self.season.update!(episode_count: current_count)
		end
	end
end
