require 'httparty'

class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy
  belongs_to :genre
  
  
  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, presence: true

  
  
  def self.movie_image(movie_id)
    base_url = 'https://api.themoviedb.org/3'
    api_key = 'your_api_key'

    url = "#{base_url}/movie/#{movie_id}/images?api_key=#{api_key}"
    response = HTTParty.get(url)

    if response.code == 200
      images = JSON.parse(response.body)['posters']
      return images.map { |image| "https://image.tmdb.org/t/p/w500#{image['file_path']}" }
    else
      return []
    end
  end
end
