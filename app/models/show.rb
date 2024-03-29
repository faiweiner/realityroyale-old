# == Schema Information
#
# Table name: shows
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  active     :boolean          default(FALSE)
#  published  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Show < ActiveRecord::Base
	include ModelHelper 	# access to toggle modules
	
	has_many :seasons, inverse_of: :show, dependent: :destroy
	has_many :episodes, through: :seasons
	has_many :schemes, inverse_of: :show

	# -- Validations on create -- #
	validates :name, presence: true, on: :create
end
