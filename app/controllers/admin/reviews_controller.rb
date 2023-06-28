class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!


  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    review = Review.find(params[:id])
    @customer = review.customer
    review.destroy
    redirect_to admin_customer_path(@customer)
  end

end
