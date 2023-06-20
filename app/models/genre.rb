class Genre < ApplicationRecord
  
  has_many :movies, dependent: :destroy
  has_many :review, dependent: :destroy
    
  validates :name, presence: true
  
end
