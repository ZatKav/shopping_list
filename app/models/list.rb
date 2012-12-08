class List < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user

  validates :name, :;ength =< { :maximum => 140 }
end
