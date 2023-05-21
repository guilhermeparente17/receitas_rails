class Category < ApplicationRecord
    has_many :revenues
    validates :description, presence: true
    
    
    
end
