# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  contestant_id :integer
#  episode_id    :integer
#  scheme_id     :integer
#  type          :text
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
	# ===== PUBLIC METHODS AVAILABLE (client/driven logic) ===== #
	# ========================================================== #

	def self.types
		%w(Altercation Competition Debauchery Extracurricular Survival)
	end

	# ========================================================== #
	# ===== PRIVATE METHODS ==================================== #
	# ========================================================== #
	
	private
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ===== League's subclasses ================================ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

class Altercation < Event	
	def self.model_name
		Event.model_name
	end
end

class Competition < Event
	def self.model_name
		Event.model_name
	end
end

class Debauchery < Event
	def self.model_name
		Event.model_name
	end
end

class Extracurricular < Event
	def self.model_name
		Event.model_name
	end
end

class Survival < Event
	def self.model_name
		Event.model_name
	end
end
