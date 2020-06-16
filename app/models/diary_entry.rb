class DiaryEntry < ApplicationRecord
    belongs_to :food, optional: true
    belongs_to :diary, optional: true
    validates :serving_size presence: true
    #accepts_nested_attributes_for :foods

     
    
end
