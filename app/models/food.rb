class Food < ApplicationRecord
    has_many :diary_entries
    has_many :diaries, through: :diary_entries
    validates :name, presence: true
    validates :calories, presence: true
    validates :protein, presence: true
    validates :carbohydrates, presence: true
    validates :fats, presence: true
    scope :alpha, -> {order(:name)}
    #accepts_nested_attributes_for :diary_entries

end
