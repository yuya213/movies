class Public::CommentsController < ApplicationController
  # ゲストユーザーとしてログインした場合は閲覧を制限する
  before_action :ensure_guest_customer


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

  # ゲストユーザーを弾く
    def ensure_guest_customer
      if current_customer.email == "guest@example.com"
        redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      end
    end


end
