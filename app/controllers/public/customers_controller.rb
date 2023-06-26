class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]
  # ゲストユーザーとしてログインした場合は閲覧を制限する
  # before_action :guest_check, only: [:update, :withdrawal]
  before_action :ensure_guest_customer, only: [:edit]#before_actionでeditアクション実行前に処理を行う

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理が完了しました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :email, :introduction, :genre_id)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
    redirect_to customer_path(current_customer)
    end
  end
  
  # ゲストユーザーを弾く
    def ensure_guest_customer
      @customer = Customer.find(params[:id])
      if @customer.email == "guest@example.com"
        redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      end
    end

end
