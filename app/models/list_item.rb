class ListItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :user_id, presence: true
  validates :list_id, presence: true
  validates :description, presence: true, length: { maximum: 255 }

  def toggle_completed!(toggle_value)    
    self.completed = toggle_value.nil? ? !self.completed : toggle_value
    self.save               
  end
end