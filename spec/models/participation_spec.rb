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

require 'spec_helper'

describe Participation do
  pending "add some examples to (or delete) #{__FILE__}"
end
