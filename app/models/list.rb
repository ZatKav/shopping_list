# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :list_item_relationships, foreign_key: "item_id", dependent: :destroy
  has_many :items, through: :list_item_relationships, source: :list

  validates :name, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'lists.created_at DESC'

  def feed

  end

  def list_items?(list)
    list_item_relationships.find_by_list_id(list.id)
  end

  def add_item_to_list!
    list_item_relationships.create!(list_id: item.id)
  end

  def remove_item_from_list!
    list_item_relationships.find_by_list_id(list.id).destroy
  end
end
