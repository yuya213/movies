class Public::SearchsController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
  end
  
end
