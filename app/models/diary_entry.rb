class DiaryEntry < ApplicationRecord
    belongs_to :food, optional: true
    belongs_to :diary, optional: true
end
