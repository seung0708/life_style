class Diary < ApplicationRecord
    belongs_to :user, optional: true
    has_many :diary_entries
    has_many :foods, through: :diary_entries
    validates :date, presence: true
    accepts_nested_attributes_for :diary_entries
    accepts_nested_attributes_for :foods


end
