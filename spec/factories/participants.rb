# == Schema Information
#
# Table name: participants
#
#  id           :integer          not null, primary key
#  league_id    :integer          not null
#  user_id      :integer          not null
#  commissioner :boolean          default(FALSE)
#  score        :integer          default(0)
#  created_at   :datetime
#  updated_at   :datetime
#  favorite     :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :participant do
    league_id 1
user_id 1
commissioner false
score 1
  end

end
