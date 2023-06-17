class Public::CommentsController < ApplicationController
  
  def create
    
    @review = Review.find(params[:review_id])
    @customer = @review.customer
    @comment = current_customer.comments.new(comment_params)
    @comment.review_id = @review.id
    @comment.save
    
    #redirect_back(fallback_location: root_path)
  end
  
  def destroy
    
    @comment = Comment.find(params[:id]).destroy
    @comment.destroy
    @review = Review.find(params[:review_id])
    
    #redirect_back(fallback_location: root_path)
  end
  
   private

  def comment_params
    params.require(:comment).permit(:comment)
  end
  
  
end
