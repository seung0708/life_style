class Diary < ApplicationRecord
    belongs_to :user, optional: true
    has_many :diary_entries
    has_many :foods, through: :diary_entries
    validates :date, presence: true
    

    def foods_attributes=(attributes)
        attributes.values.each do |food_params|
            if !food_params.values.any?(&:empty?)
                self.foods << Food.create(food_params)
            end 
        end
    end

    def diary_entries_attributes=(attributes)
        attributes.values.each do |diary_entries_params|
            if !diary_entries_params["serving_size"].empty?
                self.diary_entries << DiaryEntry.create(diary_entries_params)
            end 
        end
    end
end
