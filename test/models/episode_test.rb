# == Schema Information
#
# Table name: episodes
#
#  id             :integer          not null, primary key
#  season_id      :integer          not null
#  air_date       :datetime
#  survivor_count :integer
#  published      :boolean          default(FALSE), not null
#  aired          :boolean          default(FALSE), not null
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
