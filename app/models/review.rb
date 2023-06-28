class Review < ApplicationRecord


  belongs_to :customer
  has_many :comments, dependent: :destroy
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  # optionalで、movie_idがなくても保存できるようにしている
  belongs_to :movie, optional: true

  validates :title, presence: true
  validates :body, presence: true, length: {maximum:200}


  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @review = Review.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("title LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end



end
