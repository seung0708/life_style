class User < ApplicationRecord
    
    PASSWORD_REQUIREMENTS = /\A
        (?=.{8,}) 
        (?=.*\d)
        (?=.*[a-z])
        (?=.*[A-Z])
    /x
    
    has_secure_password
    has_many :diaries
    validates :username, presence: true
    validates :email, uniqueness: true
    #validates :password, presence: true
    require 'securerandom'
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.urlsafe_base64
        end
      end


end
