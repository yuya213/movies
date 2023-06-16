class Review < ApplicationRecord
  
  
  belongs_to :customer
  belongs_to :movie
  
  validates :title, presence: true
  validates :review, presence: true, length: {maximum:200}
  
  
  
end
