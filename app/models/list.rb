class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items               

  validates :user_id, presence: true, uniqueness: true
  validates :title, presence: true, length: { maximum: 100 }    
end