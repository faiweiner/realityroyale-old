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

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
