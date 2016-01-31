class User < ActiveRecord::Base
  EMAIL_REGEX = %r{\A[a-z0-9\.\-%_&+]+@([a-z0-9\-]+\.)+[a-z]+\z}i

  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

                    
end