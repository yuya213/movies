class Public::ReviewsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]
  # ゲストユーザーとしてログインした場合は閲覧を制限する
  # before_action :guest_check, only: [:new, :create, :update, :destroy]


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
      render 'new'
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
    @review = Review.new
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def ensure_correct_customer
    @review = Review.find(params[:id])
    @customer = @review.customer
    redirect_to(reviews_path) unless @customer == current_customer
  end

  private

  def review_params
    params.require(:review).permit(:title, :review, :customer_id, :genre_id)
  end

end
