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

class Round < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules
	
	belongs_to 			:participant, inverse_of: :rounds
	belongs_to 			:episode, inverse_of: :rounds
	has_many 				:events, through: :contestants
	has_and_belongs_to_many 	:contestants, inverse_of: :rounds
end
