class User < ActiveRecord::Base
  EMAIL_REGEX = %r{\A[a-z0-9\.\-%_&+]+@([a-z0-9\-]+\.)+[a-z]+\z}i

  before_save { self.email = email.downcase }

  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password                 
end