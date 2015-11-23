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

class Show < ActiveRecord::Base
end
