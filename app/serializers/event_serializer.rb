# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  contestant_id :integer
#  episode_id    :integer
#  scheme_id     :integer
#  type          :text
#  created_at    :datetime
#  updated_at    :datetime
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :contestant_id, :episode_id, :scheme_id
end
