# == Schema Information
#
# Table name: contestants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  age         :integer
#  gender      :string(255)
#  occupation  :string(255)
#  description :text
#  active      :boolean          default(FALSE), not null
#  published   :boolean          default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Contestant < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules
	
	has_many 								:events, inverse_of: :contestant
	has_and_belongs_to_many :seasons, inverse_of: :contestants
	has_and_belongs_to_many :rounds, inverse_of: :contestants
end
