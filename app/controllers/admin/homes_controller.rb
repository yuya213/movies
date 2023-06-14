class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @reviews = Review.all.page(params[:page])
  end
  
end
