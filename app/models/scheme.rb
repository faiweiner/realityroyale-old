# == Schema Information
#
# Table name: schemes
#
#  id          :integer          not null, primary key
#  show_id     :integer          not null
#  type        :string(255)      not null
#  description :string(255)      not null
#  points      :integer          default(0), not null
#  active      :boolean          default(FALSE)
#  published   :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Scheme < ActiveRecord::Base
	include ModelHelper

	belongs_to :show, inverse_of: :schemes

	# -- Validations on create -- #
	validates :name, presence: true, on: :create
end
