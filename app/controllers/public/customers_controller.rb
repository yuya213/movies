class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]
  
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
    params.require(:customer).permit(:name, :profile_image, :email, :introduction)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
    redirect_to customer_path(current_customer)
    end
  end
  
end
