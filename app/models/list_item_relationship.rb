# == Schema Information
#
# Table name: list_item_relationships
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListItemRelationship < ActiveRecord::Base
  attr_accessible :item_id, :list_id

  belongs_to :list, class_name: "List"
  belongs_to :item, class_name: "Item"

  validates :item_id, presence: true
  validates :list_id, presence: true
end
