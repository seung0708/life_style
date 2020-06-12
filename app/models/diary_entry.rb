class DiaryEntry < ApplicationRecord
    belongs_to :users
    belongs_to :foods
    accepts_nested_attributes_for :users
end
