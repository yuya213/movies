class Genre < ApplicationRecord

  has_many :movie, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :customer, dependent: :destroy

  validates :name, presence: true

end
