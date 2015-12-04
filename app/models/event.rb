# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  contestant_id :integer
#  episode_id    :integer
#  scheme_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base
	belongs_to :contestant_id, inverse_of: :events, dependent: :destroy
	belongs_to :episode, inverse_of: :events, dependent: :destroy
	belongs_to :scheme, inverse_of: :events, dependent: :destroy

	validates :contestant_id, presence: true, on: :create
	validates :episode_id, presence: true, on: :create	
	validates :scheme_id, presence: true, on: :create	
	
	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private
end
