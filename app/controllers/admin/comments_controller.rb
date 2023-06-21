class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!



  def destroy

    @comment = Comment.find(params[:id]).destroy
    @comment.destroy
    @review = Review.find(params[:review_id])

    redirect_back(fallback_location: root_path)
  end

   private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
