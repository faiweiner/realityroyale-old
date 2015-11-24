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

class Participation < ActiveRecord::Base
	belongs_to :user
	belongs_to :league
end
