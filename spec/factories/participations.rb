# == Schema Information
#
# Table name: participations
#
#  id           :integer          not null, primary key
#  league_id    :integer
#  user_id      :integer
#  commissioner :boolean          default(FALSE), not null
#  created_at   :datetime
#  updated_at   :datetime
#

FactoryGirl.define do
  factory :participation do
    league_id 1
user_id 1
commissioner false
  end

end
