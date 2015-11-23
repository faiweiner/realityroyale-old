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

require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
