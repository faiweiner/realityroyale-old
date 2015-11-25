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

class SchemeSerializer < ActiveModel::Serializer
  attributes :id, :show_id, :type, :description, :points, :active, :published
end
