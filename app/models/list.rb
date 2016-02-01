class List < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :title, presence: true, length: { maximum: 100 }    

  has_many :list_items               
end