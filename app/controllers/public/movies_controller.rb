class Public::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page])
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :introduction, :image)
  end
end
