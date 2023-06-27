class Public::ReviewsController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]
  # ゲストユーザーとしてログインした場合は閲覧を制限する
  # before_action :guest_check, only: [:new, :create, :update, :destroy]
  before_action :ensure_guest_customer, only: [:new]


  def edit
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    # 投稿ボタンを押下した場合
    # if params[:review]
      if @review.save# (context: :publicize)
        redirect_to review_path(@review.id), notice: "レビューを投稿しました！"
      else
        render :new
      end
    # 下書きボタンを押下した場合
    # else
      # if @review.update(is_draft: true)
        # redirect_to customer_path(current_customer), notice: "レビューを下書き保存しました！"
      # else
        # render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
     #  end
    # end
    # if @review.save
      # redirect_to review_path(@review.id), notice: "Review created successfully."
    # else
     #  render 'new'
    # end
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

  def genre
    @genre = Genre.find(params[:id])
    @review = @genre.review.page(params[:page])
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

  def genre_params
    params.require(:review).permit(:genre_name)
  end

# ゲストユーザーを弾く
  def ensure_guest_customer
      if current_customer.name == "guestcustomer"
        redirect_to reviews_path , notice: 'ゲストユーザーは新規投稿できません。'
      end
  end

end
