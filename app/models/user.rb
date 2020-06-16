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
    validates :password, format: PASSWORD_REQUIREMENTS

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex(10)
        end 
    end

end
