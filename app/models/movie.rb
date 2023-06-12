class Movie < ApplicationRecord
  
  has_many :reviews, dependent: :destroy
  belongs_to :genre
  
  has_one_attached :image
  
  
end
