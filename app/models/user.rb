class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: 6..20, confirmation: { case_sensitive: false }
  before_save { email.try(:downcase!) }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email&.strip&.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
