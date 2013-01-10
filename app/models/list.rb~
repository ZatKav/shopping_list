class List < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user

  validates :name, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'lists.created_at DESC'
end
