# == Schema Information
#
# Table name: seasons
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  number         :integer
#  show_id        :integer
#  country_origin :integer
#  type           :string(255)
#  description    :text
#  image          :string(255)
#  website        :string(255)
#  network        :integer
#  premiere_date  :datetime
#  finale_date    :datetime
#  episode_count  :integer          default(0), not null
#  active         :boolean          default(FALSE)
#  published      :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Season < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules
	
	belongs_to :show, inverse_of: :seasons
	has_many :leagues, inverse_of: :season, dependent: :destroy
	has_many :episodes, inverse_of: :season, dependent: :destroy
	has_and_belongs_to_many :contestants, inverse_of: :seasons

	# after_initialize :check_for_episodes <-- FIXME! similiar function to Episode's update_season_episode_count

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private

	def check_for_episodes
		# Each season must have one or more episodes linked to it. Site admin
		# is expected to provide an episode count upon creation (estimated if 
		# actual number is not available). As soon as an episode is created, 
		# the corresponding season's episode_count number should be updated 
		# automatically.

		if self.episodes.any?		# if episodes are linked 
			return if self.episode_count.present?	# if count is present
			self.update!(:episode_count, self.episodes.count)
		end
	end
end
