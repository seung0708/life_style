class Food < ApplicationRecord
    has_many :user_foods
    has_many :users, through: :user_foods
    #accepts_nested_attributes_for :diary_entries
end
