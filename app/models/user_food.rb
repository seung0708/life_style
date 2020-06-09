class UserFood < ApplicationRecord
    belongs_to :users
    belongs_to :foods
    
end
