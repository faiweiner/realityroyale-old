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
#  episode_count  :integer
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

	before_save :check_for_updates
	after_save :create_episodes

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private

	def check_for_updates
		puts "Checking for season updates..."
		if self.episode_count.present? && (self.episode_count != self.episodes.count)
			# FIXME!
		else
			# FIXME!
		end
	end

	def create_episodes
		if self.episodes.empty? # newly created season has any episodes?
			puts "This season #{self.name} does not have any episodes"
		end
	end
end
