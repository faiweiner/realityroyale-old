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
	has_and_belongs_to_many :seasons, inverse_of: :contestants
end