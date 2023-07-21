class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customers_params)
      redirect_to admin_customers_path(@customers)
    else
    render :show
    end
  end

  def destroy
    @customers = Customer.find(params[:id])
    @customers.destroy
    redirect_to admin_root_path
  end

private

  def customers_params
    params.require(:customer).permit(:name, :introduction, :email, :profile_image, :is_deleted)
  end

end
