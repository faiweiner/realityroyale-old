# == Schema Information
#
# Table name: schemes
#
#  id          :integer          not null, primary key
#  show_id     :integer          not null
#  type        :string(255)      not null
#  description :string(255)      not null
#  points      :integer          default(0), not null
#  active      :boolean          default(FALSE)
#  published   :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :scheme do
    show_id 1
type ""
description "MyString"
points 1
active false
published false
  end

end
