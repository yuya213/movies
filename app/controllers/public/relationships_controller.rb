class Public::RelationshipsController < ApplicationController

  def create
    current_customer.follow(params[:customer_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_back(fallback_location: root_path)
  end


  def followeings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
