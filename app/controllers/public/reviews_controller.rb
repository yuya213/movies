class Public::ReviewsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to review_path(@review.id), notice: "Review created successfully."
    else
      @reviews = Review.all
      @customer = current_customer
      render 'index'
    end
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "You have updated review successfully."
    else
      @reviews = Review.all
      render "edit"
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end
  
  def ensure_correct_customer
    @review = Review.find(params[:id])
    @customer = @review.customer
    redirect_to(reviews_path) unless @customer == current_customer
  end  
  
  private

  def review_params
    params.require(:review).permit(:title, :review, :customer_id)
  end
  
end
