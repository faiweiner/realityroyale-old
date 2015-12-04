# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  contestant_id :integer
#  episode_id    :integer
#  scheme_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

FactoryGirl.define do
  factory :event do
    contestant_id 1
episode_id 1
scheme_id 1
  end

end
