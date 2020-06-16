class Meal < ApplicationRecord
    belongs_to :diary 
    has_many :food_entries
    has_many :foods, through: :food_entries
end
