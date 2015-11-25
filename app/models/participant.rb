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
#

class Participant < ActiveRecord::Base
	belongs_to :user
	belongs_to :league
end
