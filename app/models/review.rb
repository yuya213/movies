class Review < ApplicationRecord


  belongs_to :customer

  # optionalで、movie_idがなくても保存できるようにしている
  # 今後、movie.ジャンルが完成次第、optionalを外して関連付ける予定
  belongs_to :movie, optional: true

  validates :title, presence: true
  validates :review, presence: true, length: {maximum:200}



end
