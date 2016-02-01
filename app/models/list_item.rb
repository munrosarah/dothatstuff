class ListItem < ActiveRecord::Base
  validates :user_id, presence: true
  validates :list_id, presence: true
  validates :description, presence: true, length: { maximum: 255 }                   
end