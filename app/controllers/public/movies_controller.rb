class Public::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page])
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
