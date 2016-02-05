class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items               

  validates :user_id, presence: true, uniqueness: true
  validates :title, presence: true, length: { maximum: 100 }    

  def toggle_hidden!(toggle_value)  
    self.hide_completed = 
      toggle_value.nil? ? !self.hide_completed : toggle_value
    self.save              
  end
end