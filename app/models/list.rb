class List < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }

                    
end