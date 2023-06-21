class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!


  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

end
