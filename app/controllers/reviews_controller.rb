class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new

    @review.user_name = params[:review][:user_name]
    @review.review = params[:review][:review]
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to product_path(params[:product_id])
    else
      render :new
    end
  end

  def edit
    @review = Reivew.find(params[:id])
  end

end
