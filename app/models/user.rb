class User < ApplicationRecord
    has_secure_password
    has_many :diary_entries
    has_many :user_foods
    has_many :foods, through: :user_foods
end
