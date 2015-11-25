# == Schema Information
#
# Table name: rounds
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  type           :string(255)      not null
#  episode_id     :integer          not null
#  score          :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryGirl.define do
  factory :round do
    participant_id 1
type ""
episode_id 1
score 1
  end

end
