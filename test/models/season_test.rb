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

require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
