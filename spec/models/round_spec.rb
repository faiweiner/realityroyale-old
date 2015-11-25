# == Schema Information
#
# Table name: rounds
#
#  id             :integer          not null, primary key
#  participant_id :integer          not null
#  type           :string(255)      not null
#  episode_id     :integer          not null
#  score          :integer          default(0)
#  locked         :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Round do
  pending "add some examples to (or delete) #{__FILE__}"
end
