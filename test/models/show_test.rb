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

require 'test_helper'

class ShowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
