class Public::ReviewsController < ApplicationController
  def edit
  end
  
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end
  
  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    if @review.save
      redirect_to movie_path(@movie), notice: "Review created successfully."
    else
      render :new
    end
  end

  def index
  end

  def show
  end
  
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
  
end
